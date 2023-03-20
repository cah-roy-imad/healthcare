CREATE OR REPLACE PROCEDURE export_roadrunner_coredata( p_directory IN VARCHAR2, p_log_name IN VARCHAR2 ) AS
      CURSOR c_conditions IS
      select owner, table_name from dba_tables WHERE owner in ('UWAVE','UHOSPBI','USCHEDULER','USPLY' ) and status='VALID' and temporary = 'N'
      and secondary = 'N' and nested = 'NO' and dropped = 'NO' and iot_name is null and table_name not in ( select table_name from roadrunner_coredata);
          handle1       NUMBER;    -- Data Pump job handle1
      JOBNAME       VARCHAR2 (200);
      file_prefix   VARCHAR2 (30);
      rec VARCHAR2(100);
      ind NUMBER;              -- Loop index
      spos NUMBER;             -- String starting position
      slen NUMBER;             -- String length for output
      percent_done NUMBER;     -- Percentage of job complete
      job_state VARCHAR2(30);  -- To keep track of job state
      le ku$_LogEntry;         -- For WIP and error messages
      js ku$_JobStatus;        -- The job status from get_status
      jd ku$_JobDesc;          -- The job description from get_status
      sts ku$_Status;          -- The status object returned by get_status
   BEGIN
      JOBNAME := 'EXPORT_JOB_' || TO_CHAR (SYSDATE, 'YYMMDDHH24MISS');
      handle1 := DBMS_DATAPUMP.open (operation   => 'EXPORT',
                             job_mode    => 'SCHEMA',
                             job_name    => JOBNAME,
                             version     => '19.0');
      DBMS_DATAPUMP.ADD_FILE (
         handle     => handle1,
         filename    => p_log_name,
         directory   => p_directory,
         filetype    => DBMS_DATAPUMP.KU$_FILE_TYPE_LOG_FILE
                 );
      DBMS_DATAPUMP.ADD_FILE (
         handle     => handle1,
         filename    => 'Core_%U.dmp',
         directory   => p_directory,
         filetype    => DBMS_DATAPUMP.KU$_FILE_TYPE_DUMP_FILE,
         filesize => '15G',
                 reusefile => 1
                 );
   -- dbms_datapump.set_parameter(handle => handle1, name => 'FLASHBACK_TIME', value => 'SYSTIMESTAMP');
      dbms_datapump.set_parameter(handle => handle1, name => 'COMPRESSION', value => 'ALL');
          dbms_datapump.set_parameter(handle => handle1, name => 'INCLUDE_METADATA', value => 1);
          dbms_datapump.set_parameter(handle => handle1 ,name => 'DATA_ACCESS_METHOD', value => 'AUTOMATIC');
          dbms_datapump.set_parallel(handle1,4);
     DBMS_DATAPUMP.METADATA_FILTER (handle   => handle1,
                                name     => 'SCHEMA_EXPR',
                                VALUE    => 'IN (''UREPLICAT'',''USCHEDULER'',''UWAVE'',''USPLY'',''UVPDSECURITY'',''USUPPORT'',''UAUTHORIZATION'',''UHOSPBI'',''UHOSPDEPT'',''UMULTIHOSPDEPT'',''UMFR'',''UWMINTERNAL'',''UDISTRIBUTOR'')');
     DBMS_DATAPUMP.METADATA_FILTER( handle1,'EXCLUDE_PATH_EXPR','IN (''STATISTICS'')');
-- Add query filters
    FOR rec IN c_conditions LOOP
      DBMS_DATAPUMP.DATA_FILTER
          (
        handle => handle1,
        name  => 'SUBQUERY',
        value => 'WHERE 1=0',
        table_name => rec.table_name,
        schema_name => rec.owner );
    END LOOP;
BEGIN
    dbms_datapump.start_job(handle1);
    dbms_output.put_line('Data Pump job started successfully');
    exception
      when others then
        if sqlcode = dbms_datapump.success_with_info_num
        then
          dbms_output.put_line('Data Pump job started with info available:');
          dbms_datapump.get_status(handle1,
                                   dbms_datapump.ku$_status_job_error,0,
                                   job_state,sts);
          if (bitand(sts.mask,dbms_datapump.ku$_status_job_error) != 0)
          then
            le := sts.error;
            if le is not null
            then
              ind := le.FIRST;
              while ind is not null loop
                dbms_output.put_line(le(ind).LogText);
                ind := le.NEXT(ind);
              end loop;
            end if;
          end if;
        else
          raise;
        end if;
  end;

-- The export job should now be running. In the following loop, we will monitor
-- the job until it completes. In the meantime, progress information is
-- displayed.

 percent_done := 0;
  job_state := 'UNDEFINED';
  while (job_state != 'COMPLETED') and (job_state != 'STOPPED') loop
    dbms_datapump.get_status(handle1,
           dbms_datapump.ku$_status_job_error +
           dbms_datapump.ku$_status_job_status +
           dbms_datapump.ku$_status_wip,-1,job_state,sts);
    js := sts.job_status;

-- If the percentage done changed, display the new value.

     if js.percent_done != percent_done
    then
      dbms_output.put_line('*** Job percent done = ' ||
                           to_char(js.percent_done));
      percent_done := js.percent_done;
    end if;

-- Display any work-in-progress (WIP) or error messages that were received for
-- the job.

      if (bitand(sts.mask,dbms_datapump.ku$_status_wip) != 0)
    then
      le := sts.wip;
    else
      if (bitand(sts.mask,dbms_datapump.ku$_status_job_error) != 0)
      then
        le := sts.error;
      else
        le := null;
      end if;
    end if;
    if le is not null
    then
      ind := le.FIRST;
      while ind is not null loop
        dbms_output.put_line(le(ind).LogText);
        ind := le.NEXT(ind);
      end loop;
    end if;
  end loop;

-- Indicate that the job finished and detach from it.

  dbms_output.put_line('Job has completed');
  dbms_output.put_line('Final job state = ' || job_state);
  dbms_datapump.detach(handle1);

-- Any exceptions that propagated to this point will be captured. The
-- details will be retrieved from get_status and displayed.

  exception
    when others then
      dbms_output.put_line('Exception in Data Pump job');
      dbms_datapump.get_status(handle1,dbms_datapump.ku$_status_job_error,0,
                               job_state,sts);
      if (bitand(sts.mask,dbms_datapump.ku$_status_job_error) != 0)
      then
        le := sts.error;
        if le is not null
        then
          ind := le.FIRST;
          while ind is not null loop
            spos := 1;
            slen := length(le(ind).LogText);
            if slen > 255
            then
              slen := 255;
            end if;
            while slen > 0 loop
              dbms_output.put_line(substr(le(ind).LogText,spos,slen));
              spos := spos + 255;
              slen := length(le(ind).LogText) + 1 - spos;
            end loop;
            ind := le.NEXT(ind);
          end loop;
        end if;
      end if;
END export_roadrunner_coredata;
