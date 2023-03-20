CREATE TABLE roadrunner_coredata
( OWNER varchar2(50) NOT NULL,
  TABLE_NAME varchar2(50) NOT NULL,
  IS_FULL number(2) NOT NULL,
  FILTER_PREDICATE varchar2(50) NOT NULL
);
truncate table roadrunner_coredata;
insert into roadrunner_coredata values ('UWAVE','GENERICATTRIBUTEFLAGBIT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','SINGLESIGNONISSUER',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','IDPMetadata',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','GROUPUNAUTHORIZEDMODULE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','WAVEMARKUSER',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','USERMEMBERSHIP',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','USERACCESSGROUP',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','SYSUSER',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CONTRACTPRODUCTGROUP',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODCUTPRICE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CONTRACTAGREEMENT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','UNIT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','SEQUENCENUMBERGENERATOR',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCTMFRMAPPING',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCTDIMENSION',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCTASSOCIATIONTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PROCEDURETYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PACKAGETYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','INTERFACEDEVICEFLAGBIT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','HOSPITALDEPTFLAGBIT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','EVENTTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','DIMENSION',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CURRENCY',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','BINTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','BINSTATE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','HOSPITALDEPTSUBTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','HOSPITALDEPTTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','BINPRINTFLAGBIT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','BINFLAGBIT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','WMPACKAGE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','USERLOCALE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','USERFLAGBIT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','USERACCESSGROUP',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','TRANSFERTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','TRANSFERSUBTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','DISPOSITIONEXCEPTION',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','TIMEZONE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','SYSMODULE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','SUPPLYPTTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','SUPPLYPOINTEVENTTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','SUPPLIERTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','STERILIZATION',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','INTERFACEDEVICETYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','INTERFACEATTRIBUTE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','INFORMATIONSYSTEMTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','INFORMATIONSYSTEM',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','HOSPITALUSERTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','GENERICATTRIBUTE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','EVENTACTION',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','ERRORCODE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','ENDPOINTTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','DIVISION',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCTFLAGBIT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCTCATEGORY',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCTACTIVITYTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','MODULETYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','MOBILEDEVICETYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','MFRUSERTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','MANUFACTURER',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','INVENTORYAUDITTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','BINSETATTRIBUTE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','GROUPAUTHORIZEDMODULE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','ASSIGNMENTTRANSACTIONSETTING',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCTASSOCIATIONFLAGBIT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','INTEGDELIVNET',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CABINETALERTREASON',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CUSTOMINTERFACE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CUSTOMINTERFACEATTRIBUTE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CABINETALERTISSUETYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CABINETALERTTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CABINETEVENTTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CABINETFLAGBIT',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CABINETRUNTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','CABINETTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','COUNTRY',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','COUNTRYSTATE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','DISPOSITION',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','DISPOSITIONGROUP',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCTTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCTSUBGROUP',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCTGROUP',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','STATETRANSITION',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','STATE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','RFIDTAGTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','RFIDTAGMANUFACTURER',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','RFIDREADTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','RETURNTYPE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','QUICKLINKMODULE',1,'1=1');
insert into roadrunner_coredata values ('UWAVE','PRODUCTUPN',1,'1=1');