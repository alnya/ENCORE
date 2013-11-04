--------------------------------------------------------
--  File created - Sunday-March-25-2012   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_AUDITLOG
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_AUDITLOG"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 221 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FIELD
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_FIELD"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FIELDGROUP
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_FIELDGROUP"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FIELDGROUPFIELD
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_FIELDGROUPFIELD"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PROJECT
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_PROJECT"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PROJECTFIELD
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_PROJECTFIELD"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 421 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PROJECTSITE
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_PROJECTSITE"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 181 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PROJECTSITESUMMARY
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_PROJECTSITESUMMARY"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REPORT
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_REPORT"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REPORTFIELD
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_REPORTFIELD"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REPORTPROJECTREQUEST
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_REPORTPROJECTREQUEST"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REPORTSITE
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_REPORTSITE"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_SITE
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_SITE"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_SITECONTACT
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_SITECONTACT"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_SYSTEMUSER
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SEQ_SYSTEMUSER"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SITETYPE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."SITETYPE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence UNIT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ENCORE"."UNIT_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table AUDITLOG
--------------------------------------------------------

  CREATE TABLE "ENCORE"."AUDITLOG" 
   (	"ID" NUMBER, 
	"AUDITTYPE" VARCHAR2(200 BYTE), 
	"SOURCE" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"SYSTEMUSERID" NUMBER, 
	"URL" VARCHAR2(500 BYTE), 
	"CREATEDON" DATE, 
	"DELETED" NUMBER(1,0) DEFAULT 0
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FIELD
--------------------------------------------------------

  CREATE TABLE "ENCORE"."FIELD" 
   (	"ID" NUMBER(5,0), 
	"NAME" VARCHAR2(500 BYTE), 
	"UNITID" NUMBER(5,0), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"CREATEDON" DATE, 
	"MODIFIEDON" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FIELDGROUP
--------------------------------------------------------

  CREATE TABLE "ENCORE"."FIELDGROUP" 
   (	"ID" NUMBER(5,0), 
	"NAME" VARCHAR2(500 BYTE), 
	"CREATEDON" DATE, 
	"MODIFIEDON" DATE, 
	"DELETED" NUMBER(1,0) DEFAULT 0
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FIELDGROUPFIELD
--------------------------------------------------------

  CREATE TABLE "ENCORE"."FIELDGROUPFIELD" 
   (	"ID" NUMBER(5,0), 
	"FIELDGROUPID" NUMBER(5,0), 
	"FIELDID" NUMBER(5,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROJECT
--------------------------------------------------------

  CREATE TABLE "ENCORE"."PROJECT" 
   (	"ID" NUMBER(5,0), 
	"NAME" VARCHAR2(256 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"APIURL" VARCHAR2(256 BYTE), 
	"LASTAPIHIT" DATE, 
	"CREATEDON" DATE, 
	"MODIFIEDON" DATE, 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"SYSTEMUSERID" NUMBER(5,0), 
	"TERMS" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROJECTFIELD
--------------------------------------------------------

  CREATE TABLE "ENCORE"."PROJECTFIELD" 
   (	"ID" NUMBER(5,0), 
	"PROJECTID" NUMBER(5,0), 
	"FIELDID" NUMBER(5,0), 
	"NAME" VARCHAR2(500 BYTE), 
	"UNIT" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"CREATEDON" DATE, 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"SOURCEID" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROJECTSITE
--------------------------------------------------------

  CREATE TABLE "ENCORE"."PROJECTSITE" 
   (	"ID" NUMBER(5,0), 
	"PROJECTID" NUMBER(5,0), 
	"SITEID" NUMBER(5,0), 
	"NAME" VARCHAR2(500 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"LATITUDE" NUMBER(10,5), 
	"LONGITUDE" NUMBER(10,5), 
	"CREATEDON" DATE, 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"SOURCEID" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROJECTSITESUMMARY
--------------------------------------------------------

  CREATE TABLE "ENCORE"."PROJECTSITESUMMARY" 
   (	"ID" NUMBER(5,0), 
	"PROJECTID" NUMBER(5,0), 
	"SITEID" NUMBER(5,0), 
	"FIELDID" NUMBER(5,0), 
	"ROWCOUNT" NUMBER(5,0), 
	"VALUEMINDATE" DATE, 
	"VALUEMAXDATE" DATE, 
	"CREATEDON" DATE, 
	"MODIFIEDON" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REPORT
--------------------------------------------------------

  CREATE TABLE "ENCORE"."REPORT" 
   (	"ID" NUMBER(5,0), 
	"NAME" VARCHAR2(500 BYTE), 
	"REQUESTSTATUS" VARCHAR2(20 BYTE), 
	"LASTDATAREQUESTDATE" DATE, 
	"CREATEDON" DATE, 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"MODIFIEDON" DATE, 
	"SYSTEMUSERID" NUMBER(5,0), 
	"REPORTDATEFROM" DATE, 
	"REPORTDATETO" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REPORTFIELD
--------------------------------------------------------

  CREATE TABLE "ENCORE"."REPORTFIELD" 
   (	"ID" NUMBER(5,0), 
	"REPORTID" NUMBER(5,0), 
	"FIELDID" NUMBER(5,0), 
	"FIELDORDER" NUMBER(5,0), 
	"ALIAS" VARCHAR2(500 BYTE), 
	"FILTEROPERATOR" VARCHAR2(20 BYTE), 
	"FILTERVALUE" VARCHAR2(500 BYTE), 
	"FILTERFIELDID" NUMBER(5,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REPORTPROJECTREQUEST
--------------------------------------------------------

  CREATE TABLE "ENCORE"."REPORTPROJECTREQUEST" 
   (	"ID" NUMBER(5,0), 
	"REPORTID" NUMBER(5,0), 
	"PROJECTID" NUMBER(5,0), 
	"STATUS" VARCHAR2(20 BYTE), 
	"CREATEDON" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REPORTSITE
--------------------------------------------------------

  CREATE TABLE "ENCORE"."REPORTSITE" 
   (	"ID" NUMBER(5,0), 
	"REPORTID" NUMBER(5,0), 
	"SITEID" NUMBER(5,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SITE
--------------------------------------------------------

  CREATE TABLE "ENCORE"."SITE" 
   (	"ID" NUMBER(5,0), 
	"NAME" VARCHAR2(256 BYTE), 
	"DESCRIPTION" VARCHAR2(4000 BYTE), 
	"CREATEDON" DATE, 
	"MODIFIEDON" DATE, 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"LATITUDE" NUMBER(10,5), 
	"LONGITUDE" NUMBER(10,5), 
	"GMTOFFSET" NUMBER(5,0), 
	"COUNTRY" VARCHAR2(200 BYTE), 
	"ELEVATION" VARCHAR2(200 BYTE), 
	"SITETYPEID" NUMBER(5,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SITECONTACT
--------------------------------------------------------

  CREATE TABLE "ENCORE"."SITECONTACT" 
   (	"ID" NUMBER(5,0), 
	"SITEID" NUMBER(5,0), 
	"SYSTEMUSERID" NUMBER(5,0), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"CREATEDON" DATE, 
	"MODIFIEDON" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SITETYPE
--------------------------------------------------------

  CREATE TABLE "ENCORE"."SITETYPE" 
   (	"ID" NUMBER(5,0), 
	"NAME" VARCHAR2(200 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SYSTEMUSER
--------------------------------------------------------

  CREATE TABLE "ENCORE"."SYSTEMUSER" 
   (	"ID" NUMBER(5,0), 
	"NAME" VARCHAR2(500 BYTE), 
	"EMAIL" VARCHAR2(500 BYTE), 
	"PASSWORD" VARCHAR2(256 BYTE), 
	"CREATEDON" DATE, 
	"MODIFIEDON" DATE, 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"LASTLOGGEDON" DATE, 
	"ADMINISTRATOR" NUMBER(1,0) DEFAULT 0, 
	"ORGANISATION" VARCHAR2(2000 BYTE), 
	"ORGANISATIONURL" VARCHAR2(2000 BYTE), 
	"COUNTRY" VARCHAR2(256 BYTE), 
	"AREAOFRESEARCH" VARCHAR2(4000 BYTE), 
	"URL" VARCHAR2(500 BYTE), 
	"TWITTER" VARCHAR2(500 BYTE), 
	"FACEBOOK" VARCHAR2(500 BYTE), 
	"LINKEDIN" VARCHAR2(500 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table UNIT
--------------------------------------------------------

  CREATE TABLE "ENCORE"."UNIT" 
   (	"ID" NUMBER(5,0), 
	"NAME" VARCHAR2(200 BYTE), 
	"DATATYPE" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View VWFIELDGROUPFIELD
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ENCORE"."VWFIELDGROUPFIELD" ("ID", "FIELDGROUPID", "NAME") AS 
  select f.ID,fgf.FIELDGROUPID, f.NAME from fieldgroupfield fgf inner join FIELD f on fgf.FIELDID = f.ID;
--------------------------------------------------------
--  DDL for View VWFIELDUNIT
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ENCORE"."VWFIELDUNIT" ("ID", "NAME", "UNITID", "UNITNAME", "DATATYPE", "DESCRIPTION") AS 
  SELECT f.ID,
    f.NAME,
    f.UNITID,
    u.NAME AS UNITNAME,
    u.DATATYPE,
    f.DESCRIPTION
  FROM FIELD f
  INNER JOIN UNIT u
  ON f.UNITID = u.ID;
--------------------------------------------------------
--  DDL for View VWREPORTFIELD
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ENCORE"."VWREPORTFIELD" ("ID", "REPORTID", "FIELDORDER", "NAME") AS 
  select f.ID,rf.REPORTID, rf.FIELDORDER, f.NAME from REPORTFIELD rf inner join FIELD f on rf.FIELDID = f.ID;
--------------------------------------------------------
--  DDL for View VWREPORTSITE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "ENCORE"."VWREPORTSITE" ("ID", "REPORTID", "NAME") AS 
  select s.ID,rs.REPORTID, s.NAME from REPORTSITE rs inner join SITE s on rs.SITEID = s.ID;
REM INSERTING into ENCORE.AUDITLOG
SET DEFINE OFF;
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (4,'Login','ASP.default_aspx, App_Web_o1vlykn1, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null',null,2,'~/default.aspx',to_date('29-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (5,'Login','ASP.default_aspx',null,2,'~/Default.aspx',to_date('29-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (26,'Edit','ASP.project_detail_aspx','Project Edited. ID: 8',2,'~/project/detail.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (34,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('01-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (35,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('01-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (44,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (49,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (58,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (59,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (60,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (61,'Add','ASP.report_detail_aspx','Report Added. Name: Test Report Too',2,'~/report/detail.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (62,'Add','ASP.report_detail_aspx','Report Added. Name: Test Report Too',2,'~/report/detail.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (63,'Add','ASP.report_detail_aspx','Report Added. Name: Test Report Too',2,'~/report/detail.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (64,'Add','ASP.report_detail_aspx','Report Added. Name: Test Report Too',2,'~/report/detail.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (65,'Add','ASP.report_detail_aspx','Report Added. Name: Test Report Too',2,'~/report/detail.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (66,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (67,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (68,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (69,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (82,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('09-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (83,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('09-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (84,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('13-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (141,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (142,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (143,'Edit','ASP.project_detail_aspx','Project Edited. ID: 8',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (144,'Edit','ASP.project_detail_aspx','Project Edited. ID: 8',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (145,'Edit','ASP.project_detail_aspx','Project Edited. ID: 8',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (146,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (147,'TaskManager','Getting sites for project: 8',null,0,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (148,'TaskManager','Getting sites for project: 8',null,0,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (149,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (150,'TaskManager','Getting sites for project: 8',null,0,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (151,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (152,'TaskManager','Getting sites for project: 8',null,0,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (153,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (154,'TaskManager','Getting sites for project: 8',null,0,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (157,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (163,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (164,'TaskManager','Getting fields for project: 8',null,0,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (165,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (166,'Edit','ASP.report_detail_aspx','Report Marked as Deleted. ID: 5',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (167,'Edit','ASP.report_detail_aspx','Report Marked as Deleted. ID: 6',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (168,'Edit','ASP.report_detail_aspx','Report Marked as Deleted. ID: 3',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (169,'Edit','ASP.report_detail_aspx','Report Marked as Deleted. ID: 7',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (170,'Edit','ASP.report_detail_aspx','Report Marked as Deleted. ID: 4',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (171,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (172,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (173,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (174,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (175,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (176,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (177,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (216,'Login','ASP.default_aspx',null,2,null,to_date('25-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (217,'Login','ASP.default_aspx',null,2,null,to_date('25-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (218,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('25-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (219,'TaskManager','Getting data for task 10',null,0,null,to_date('25-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (220,'Login','ASP.default_aspx',null,2,null,to_date('25-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (9,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (10,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (11,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (12,'Edit','ASP.user_detail_aspx','User Edited. ID: 2',2,'~/user/detail.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (13,'Edit','ASP.user_detail_aspx','User Edited. ID: 2',2,'~/user/detail.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (14,'Add','ASP.user_detail_aspx','User Added. Email: test@test.com',2,'~/user/detail.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (15,'Edit','ASP.user_detail_aspx','User Marked as Deleted. ID: 21',2,'~/user/detail.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (16,'Edit','ASP.user_detail_aspx','User Edited. ID: 21',2,'~/user/detail.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (17,'Edit','ASP.user_mydetails_aspx','User Edited. ID: 2',2,'~/user/mydetails.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (18,'Edit','ASP.user_mydetails_aspx','User Edited. ID: 2',2,'~/user/mydetails.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (19,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (25,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (27,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (28,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (40,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('01-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (41,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('01-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (51,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (52,'Add','ASP.report_detail_aspx','Report Added. Name: Test Report',2,'~/report/detail.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (70,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (71,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (72,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('06-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (101,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (102,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (104,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (105,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (106,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (107,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (108,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (109,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (110,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (111,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (112,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (113,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (114,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (115,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (116,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (117,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (118,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (119,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (120,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (121,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (122,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (123,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (124,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (125,'Add','ASP.field_detail_aspx','Field Added. Name: Precipitation',2,'~/field/detail.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (126,'Edit','ASP.field_detail_aspx','Field Edited. ID: 2',2,'~/field/detail.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (127,'Edit','ASP.field_detail_aspx','Field Edited. ID: 21',2,'~/field/detail.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (128,'Login','ASP.default_aspx',null,2,'~/Default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (129,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('16-FEB-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (155,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (156,'TaskManager','Getting sites for project: 8',null,0,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (158,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (160,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (161,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (162,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (29,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (30,'Add','ASP.field_units_aspx','Unit Added: cm',2,'~/field/units.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (31,'Add','ASP.field_units_aspx','Unit Added: %',2,'~/field/units.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (32,'Edit','ASP.field_units_aspx','Project Marked as Deleted. Name: %',2,'~/field/units.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (33,'Add','ASP.project_detail_aspx','Project Added. Name: Climanni',2,'~/project/detail.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (6,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('29-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (8,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (20,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (21,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (22,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (23,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (24,'Edit','ASP.site_detail_aspx','Site Edited. ID: 1',2,'~/site/detail.aspx',to_date('30-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (36,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('01-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (37,'Add','ASP.field_group_aspx','Group Added: Test Group',2,'~/field/group.aspx',to_date('01-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (38,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('01-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (39,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('01-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (159,'Login','ASP.default_aspx',null,2,null,to_date('19-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (178,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (179,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (180,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (181,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (182,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (183,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (184,'TaskManager','Getting data for task 1',null,0,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (185,'TaskManager','Get Data for task 1 failed with exception: LINQ to Entities does not recognize the method ''Int32 Parse(System.String)'' method, and this method cannot be translated into a store expression.',null,0,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (186,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (187,'TaskManager','Getting data for task 1',null,0,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (188,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (189,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (190,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (191,'TaskManager','Getting data for task 2',null,0,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (192,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (193,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (194,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (195,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (196,'TaskManager','Getting data for task 3',null,0,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (197,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (198,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (199,'TaskManager','Getting data for task 4',null,0,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (200,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (201,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (202,'TaskManager','Getting data for task 5',null,0,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (203,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (204,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (205,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (206,'TaskManager','Getting data for task 6',null,0,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (207,'Login','ASP.default_aspx',null,2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (208,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (209,'TaskManager','Getting data for task 7',null,0,null,to_date('20-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (210,'Login','ASP.default_aspx',null,2,null,to_date('21-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (211,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('21-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (212,'TaskManager','Getting data for task 8',null,0,null,to_date('21-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (213,'Login','ASP.default_aspx',null,2,null,to_date('21-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (214,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,null,to_date('21-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (215,'TaskManager','Getting data for task 9',null,0,null,to_date('21-MAR-12','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (7,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('29-OCT-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (42,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('01-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (43,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('01-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (45,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (46,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (47,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (48,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (50,'Edit','ASP.field_group_aspx','Group Edited. ID: 1',2,'~/field/group.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (53,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (54,'Add','ASP.report_detail_aspx','Report Added. Name: Test Report',2,'~/report/detail.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (55,'Edit','ASP.report_detail_aspx','Report Edited. ID: 2',2,'~/report/detail.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (56,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (57,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('02-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (81,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('08-NOV-11','DD-MON-RR'),0);
Insert into ENCORE.AUDITLOG (ID,AUDITTYPE,SOURCE,DESCRIPTION,SYSTEMUSERID,URL,CREATEDON,DELETED) values (103,'Login','ASP.default_aspx',null,2,'~/default.aspx',to_date('15-FEB-12','DD-MON-RR'),0);
REM INSERTING into ENCORE.FIELD
SET DEFINE OFF;
Insert into ENCORE.FIELD (ID,NAME,UNITID,DESCRIPTION,CREATEDON,MODIFIEDON) values (21,'Precipitation',2,'asdadads',to_date('15-FEB-12','DD-MON-RR'),to_date('15-FEB-12','DD-MON-RR'));
Insert into ENCORE.FIELD (ID,NAME,UNITID,DESCRIPTION,CREATEDON,MODIFIEDON) values (2,'Meters',8,'asSas',to_date('30-OCT-11','DD-MON-RR'),to_date('15-FEB-12','DD-MON-RR'));
Insert into ENCORE.FIELD (ID,NAME,UNITID,DESCRIPTION,CREATEDON,MODIFIEDON) values (3,'Distance',1,null,to_date('01-NOV-11','DD-MON-RR'),to_date('01-NOV-11','DD-MON-RR'));
Insert into ENCORE.FIELD (ID,NAME,UNITID,DESCRIPTION,CREATEDON,MODIFIEDON) values (41,'H20_concentration',1,null,to_date('20-MAR-12','DD-MON-RR'),to_date('20-MAR-12','DD-MON-RR'));
REM INSERTING into ENCORE.FIELDGROUP
SET DEFINE OFF;
Insert into ENCORE.FIELDGROUP (ID,NAME,CREATEDON,MODIFIEDON,DELETED) values (1,'Test Group',to_date('01-NOV-11','DD-MON-RR'),to_date('15-FEB-12','DD-MON-RR'),0);
REM INSERTING into ENCORE.FIELDGROUPFIELD
SET DEFINE OFF;
Insert into ENCORE.FIELDGROUPFIELD (ID,FIELDGROUPID,FIELDID) values (38,1,2);
Insert into ENCORE.FIELDGROUPFIELD (ID,FIELDGROUPID,FIELDID) values (39,1,3);
REM INSERTING into ENCORE.PROJECT
SET DEFINE OFF;
Insert into ENCORE.PROJECT (ID,NAME,DESCRIPTION,APIURL,LASTAPIHIT,CREATEDON,MODIFIEDON,DELETED,SYSTEMUSERID,TERMS) values (8,'NitroEurope','Test description','http://neudev.ceh.ac.uk/encore/encore.asmx',to_date('30-OCT-11','DD-MON-RR'),to_date('30-OCT-11','DD-MON-RR'),to_date('19-MAR-12','DD-MON-RR'),0,2,'asdadadasdadadasdadadasdadadasdadadasdadadasdadadasdadadasdadadasdadadasdadadasdadadasdadadasdadad');
Insert into ENCORE.PROJECT (ID,NAME,DESCRIPTION,APIURL,LASTAPIHIT,CREATEDON,MODIFIEDON,DELETED,SYSTEMUSERID,TERMS) values (9,'Climanni','This is a description','http://climanni.test.com',null,to_date('30-OCT-11','DD-MON-RR'),to_date('30-OCT-11','DD-MON-RR'),0,2,'blah blah blah');
REM INSERTING into ENCORE.PROJECTFIELD
SET DEFINE OFF;
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (1,8,null,'Test Field','Meters',null,to_date('06-NOV-11','DD-MON-RR'),0,null);
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (21,8,null,'Additional_WMS_Reactive_N_flux_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17771');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (22,8,null,'Additional_WMS_NO3_and_NH4_concentration_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17772');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (23,8,null,'Extra_flux_Aerosol_nitrate_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17773');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (24,8,null,'Extra_flux_aerosol_nitric_acid_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17774');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (25,8,null,'Extra_flux_aerosol ammonium_measure_height',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17775');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (26,8,null,'WMS_Soil_NO3_at_depth1b_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17776');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (27,8,null,'WMS_Soil_NO3_at_depth1a_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17777');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (28,8,null,'WMS_Soil_NH4_at_depth1b_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17778');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (29,8,null,'Extra_conc_End_date',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17779');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (30,8,null,'Extra_conc_NO2_at_height2','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17780');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (31,8,null,'Extra_conc_NO2_at_height3','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17781');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (32,8,null,'Extra_conc_NO2_at_height4','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17782');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (33,8,null,'Extra_conc_NO2_at_height5','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17783');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (34,8,null,'Extra_conc_NO_at_height4','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17784');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (35,8,null,'Extra_conc_NO_at_height5','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17785');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (36,8,null,'Extra_conc_NO_at_height6','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17786');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (37,8,null,'Extra_conc_O3_at_height3','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17787');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (38,8,null,'Extra_conc_O3_at_height4','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17788');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (39,8,null,'Extra_conc_O3_at_height6','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17789');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (40,8,null,'NOx_and_O3_NO2_conc_height3','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17790');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (41,8,null,'NOx_and_O3_NO_conc_height2','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17791');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (42,8,null,'NOx_and_O3_NO_conc_height4','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17792');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (43,8,null,'NOx_and_O3_NO_conc_height5','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17793');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (44,8,null,'NOx_and_O3_O3_conc_height3','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17794');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (45,8,null,'NOx_and_O3_O3_conc_height4','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17795');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (46,8,null,'NOx_and_O3_O3_conc_height5','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17796');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (47,8,null,'Worksheet_field_name',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17797');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (48,8,null,'Comment_Worksheet_name',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17798');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (49,8,null,'Submission_comment',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17799');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (50,8,null,'Net_radiation','W  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17800');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (51,8,null,'Max_Canopy_Height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17801');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (52,8,null,'Grazing_period_dates',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17802');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (53,8,null,'Additional_special_topics_Aerosol_Nitric_acid _nitrate_concentration_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17803');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (54,8,null,'Additional_WMS_Soil_Total_N_at_depth_1a_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17804');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (55,8,null,'Additional_WMS_Soil_Total_N_at_depth_2_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17805');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (56,8,null,'Additional_WMS_Soil_Total_N_at_depth_1_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17806');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (57,8,null,'Additional_WMS_Stemflow_Total_N_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17807');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (58,8,null,'Additional_WMS_Wet-dep_total_N_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17808');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (59,8,null,'WMS_Soil_NH4_at_depth1a_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17809');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (60,8,null,'Extra_conc_NO_at_height2','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17810');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (61,8,null,'Extra_conc_O3_at_height2','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17811');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (62,8,null,'Extra_conc_O3_at_height5','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17812');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (63,8,null,'NOx_and_O3_NO_conc_height1','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17813');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (64,8,null,'NOx_and_O3_NO_conc_height3','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17814');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (65,8,null,'NOx_and_O3_O3_conc_height1','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17815');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (66,8,null,'NOx_and_O3_O3_conc_height2','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17816');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (67,8,null,'Litter_fractions_mass','g',null,to_date('19-MAR-12','DD-MON-RR'),0,'17817');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (68,8,null,'Needle_N','% N  dry matter',null,to_date('19-MAR-12','DD-MON-RR'),0,'17818');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (69,8,null,'Crop_details',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17819');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (70,8,null,'Plant_species_1_cover',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17820');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (71,8,null,'Additional_WMS_Soil_Total_N_at_depth_2a_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17821');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (72,8,null,'Additional_WMS_Soil_NH4_at_depth_3_depth ','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17822');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (73,8,null,'Additional_WMS_Throughfall_Total_N_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17823');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (74,8,null,'EXCEL_cell_ref',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17824');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (75,8,null,'Plant_species_3',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17825');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (76,8,null,'Plant_species_2',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17826');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (77,8,null,'Plant_species_4',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17827');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (78,8,null,'Plant_species_1',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17828');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (79,8,null,'4_a_day_NO_flux','ug N m-2  h-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17829');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (80,8,null,'4_a_day_N2O_flux','ug N m-2  h-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17830');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (81,8,null,'4_a_day_CH4_flux','ug CH4 m-2  h-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17831');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (82,8,null,'Atmospheric_stability_parameter',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17832');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (83,8,null,'Sensible_heat_flux','W  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17833');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (84,8,null,'NO_concentration_30_min','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17834');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (85,8,null,'Global_radiation','W  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17835');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (86,8,null,'Soil_temperature_depth_1','yr C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17836');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (87,8,null,'Soil_temperature_depth_3','º  C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17837');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (88,8,null,'Soil_water_content_3','m3 water m-3 soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'17838');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (89,8,null,'Wind_direction','º',null,to_date('19-MAR-12','DD-MON-RR'),0,'17839');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (90,8,null,'NO2_flux_special','ng N m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17840');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (91,8,null,'Wet_dep_start_date',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17841');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (92,8,null,'Wet_dep_end_date',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17842');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (93,8,null,'Bulk_N_NO3','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17843');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (94,8,null,'Stemflow_total','mm',null,to_date('19-MAR-12','DD-MON-RR'),0,'17844');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (95,8,null,'Stemflow_N_NH4','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17845');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (96,8,null,'SoilNO3_1_A','mg NO3- L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17846');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (97,8,null,'Extra_flux_NO2_flux_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17847');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (98,8,null,'Extra_flux_N2O_flux_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17848');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (99,8,null,'Extra_flux_NH3_flux_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17849');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (100,8,null,'Extra_flux_CH4_flux_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17850');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (101,8,null,'Snow_depth','mm',null,to_date('19-MAR-12','DD-MON-RR'),0,'17851');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (102,8,null,'WMS_CH4_flux','ug CH4 m-2  h-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17852');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (103,8,null,'WMS_Tissue_C','% C dry matter',null,to_date('19-MAR-12','DD-MON-RR'),0,'17853');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (104,8,null,'WMS_Stemflow','mm',null,to_date('19-MAR-12','DD-MON-RR'),0,'17854');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (105,8,null,'WMS_Mineral_fertilizer_chem_form',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17855');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (106,8,null,'WMS_Mineral_fertilizer_N',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17856');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (107,8,null,'WMS_Mineral_fertilizer_P',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17857');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (108,8,null,'WMS_Mineral_fertilizer_K',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17858');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (109,8,null,'WMS_Animal_Live_weight','kg',null,to_date('19-MAR-12','DD-MON-RR'),0,'17859');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (110,8,null,'Animal_Type',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17860');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (111,8,null,'Biomass_residues','kg  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17861');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (112,8,null,'Site_preparation',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17862');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (113,8,null,'Herbicides',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17863');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (114,8,null,'Irrigation',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17864');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (115,8,null,'Irrigation_water_applied',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17865');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (116,8,null,'Other_Events',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17866');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (117,8,null,'4_a_day_NO2_flux','ug N m-2  h-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17867');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (118,8,null,'4_a_day_O3_flux','ug 03 m-2  h-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17868');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (119,8,null,'4_a_day_CO2_flux','umol C02 m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17869');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (120,8,null,'Soil_temperature_depth_4','º  C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17870');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (121,8,null,'Evapotranspiration','mm  d-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17871');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (122,8,null,'Incoming_longwave_radiation','W  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17872');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (123,8,null,'Relative_humidity','%',null,to_date('19-MAR-12','DD-MON-RR'),0,'17873');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (124,8,null,'NH3_concentration_special','ng K m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17874');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (125,8,null,'NO_flux_special','ng N m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17875');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (126,8,null,'Throughfall_N_NH4','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17876');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (127,8,null,'Suction_Wet_dep_start_date',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17877');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (128,8,null,'SoilNH4_1_A','mg NH4 L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17878');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (129,8,null,'Soil water N2O_1_A','ppb N',null,to_date('19-MAR-12','DD-MON-RR'),0,'17879');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (130,8,null,'SoilNH4_2_A','mg NH4 L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17880');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (131,8,null,'WMS_Soil_NO3_at_depth_2_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17881');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (132,8,null,'WMS_Leaf_C_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17882');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (133,8,null,'WMS_Methane_flux_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17883');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (134,8,null,'WMS_Stemflow_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17884');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (135,8,null,'WMS_Standing_leaf_biomass_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17885');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (136,8,null,'WMS_Throughfall_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17886');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (137,8,null,'Fsoil_4_day_NO_no_chambers',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17887');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (138,8,null,'Fsoil_4_day_NO2_no_chambers',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17888');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (139,8,null,'Fsoil_4_day_O3_no_chambers',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17889');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (140,8,null,'30_min_flux_CO2_conc_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17890');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (141,8,null,'30_min_flux_Sensible_heat_flux_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17891');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (142,8,null,'30_min_flux_Friction_velocity_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17892');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (143,8,null,'30_min_flux_NO_conc_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17893');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (144,8,null,'WMS_wet_dep_Wet_dep_throughfall_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17894');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (145,8,null,'WMS_wet_dep_Stemflow_N03_N_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17895');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (146,8,null,'Stocking_density_2','Livestock Units  ha-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17896');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (147,8,null,'Soil_water_content_4','m3 water m-3 soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'17897');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (148,8,null,'WMS_Animal_Live_weight_3','kg',null,to_date('19-MAR-12','DD-MON-RR'),0,'17898');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (149,8,null,'Wet_N_NO3_dep','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17899');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (150,8,null,'Extra_flux_O3_flux_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17900');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (151,8,null,'WMS_wet_dep_Stemflow_NH4_N_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17901');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (152,8,null,'Suction_cup_Soil_Water_NH4_conc_depth2_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17902');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (153,8,null,'Suction_cup_Soil_Water_NO3_conc_depth1_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17903');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (154,8,null,'Snow_depth_30_min_met','cm',null,to_date('19-MAR-12','DD-MON-RR'),0,'17904');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (155,8,null,'WMS_wet_dep_Bulk_Total_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17905');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (156,8,null,'WMS_wet_dep_Bulk_NH4_N_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17906');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (157,8,null,'WMS_wet_dep_Bulk_N03_N_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17907');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (158,8,null,'WMS_wet_dep_Throughfall_N03_N_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17908');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (159,8,null,'WMS_wet_dep_Stemflow_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17909');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (160,8,null,'Suction_cup_Soil_Water_NH4_conc_depth1_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17910');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (161,8,null,'Suction_cup_Soil_Water_NO3_conc_depth2_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17911');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (162,8,null,'Suction_cup_Soil_Water_NH4_conc_depth1_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17912');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (163,8,null,'Suction_cup_Soil_Water_NH4_conc_depth2_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17913');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (164,8,null,'Suction_cup_Soil_Water_NO3_conc_depth2_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17914');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (165,8,null,'Suction_cup_Diss_N2O_conc_in_soil_water_depth1_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17915');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (166,8,null,'WMS_Soil_moisture_percent_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17916');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (167,8,null,'WMS_soil_moisture','%',null,to_date('19-MAR-12','DD-MON-RR'),0,'17917');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (168,8,null,'Tissue_CN_ratio',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17918');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (169,8,null,'WMS_Dip_well_water_table','cm',null,to_date('19-MAR-12','DD-MON-RR'),0,'17919');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (170,8,null,'WMS_wet_dep_Throughfall_NH4_N_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17920');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (171,8,null,'Suction_cup_Soil_Water_NO3_conc_depth1_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17921');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (172,8,null,'Stocking_density_3','Livestock Units  ha-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17922');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (173,8,null,'Vegetation_height_after_cut','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17923');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (174,8,null,'Suction_cup_Soil_N2O_gas_conc_depth2_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17924');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (175,8,null,'Soil_NH4_depth_1a','g N kg-1 dry soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'17925');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (176,8,null,'Animal_Type_3',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17926');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (177,8,null,'Wet_N_NH4_dep','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17927');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (178,8,null,'Soil_NO3_depth_1a','g N kg-1 dry soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'17928');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (179,8,null,'WMS_Organic_fertilizer_volume','m3  ha-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17929');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (180,8,null,'Animal_Type_2',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17930');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (181,8,null,'WMS_Animal_Live_weight_2','kg',null,to_date('19-MAR-12','DD-MON-RR'),0,'17931');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (182,8,null,'Suction_cup_Diss_CH4_conc_in_soil_water_depth2_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17932');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (183,8,null,'Suction_cup_Soil_CH4_gas_conc_depth1_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17933');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (184,8,null,'Additional_special_topics_Aerosol_Nitric_acid_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17934');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (185,8,null,'Soil water N2O_2_A','ppb N',null,to_date('19-MAR-12','DD-MON-RR'),0,'17935');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (186,8,null,'Soil water_N2O_1_B','ppb N',null,to_date('19-MAR-12','DD-MON-RR'),0,'17936');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (187,8,null,'Soil water_CH4_2_A','ppb C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17937');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (188,8,null,'Soil gas N2O_1_A','ppb N',null,to_date('19-MAR-12','DD-MON-RR'),0,'17938');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (189,8,null,'Soil gas N2O_1_B','ppb N',null,to_date('19-MAR-12','DD-MON-RR'),0,'17939');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (190,8,null,'Soil gas N2O_2_B','ppb N',null,to_date('19-MAR-12','DD-MON-RR'),0,'17940');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (191,8,null,'Soil gas CH4 _1_A','ppb C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17941');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (192,8,null,'Soil gas CH4 _2_B','ppb C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17942');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (193,8,null,'WMS_wet_dep_Wet_only_NH4_N_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17943');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (194,8,null,'Suction_cup_Soil_N2O_gas_conc_depth2_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17944');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (195,8,null,'Suction_cup_Soil_CH4_gas_conc_depth2_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17945');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (196,8,null,'Soil water_N2O_2_B','ppb N',null,to_date('19-MAR-12','DD-MON-RR'),0,'17946');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (197,8,null,'Soil water_CH4_2_B','ppb C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17947');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (198,8,null,'WMS_wet_dep_Wet_only_Total_deposition_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17948');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (199,8,null,'WMS_wet_dep_Wet_only_N03_N_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17949');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (200,8,null,'Suction_cup_Diss_CH4_conc_in_soil_water_depth2_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17950');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (201,8,null,'Suction_cup_Soil_N2O_gas_conc_depth1_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17951');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (202,8,null,'Suction_cup_Soil_CH4_gas_conc_depth2_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17952');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (203,8,null,'Soil_NH4_depth_1b','g N kg-1 dry soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'17953');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (204,8,null,'SoilNO3_2_B','mg NO3- L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17954');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (205,8,null,'Soil water_CH4_1_A','ppb C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17955');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (206,8,null,'Suction_cup_Diss_N2O_conc_in_soil_water_depth2_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17956');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (207,8,null,'Suction_cup_Soil_N2O_gas_conc_depth1_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17957');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (208,8,null,'Nitric_acid_Special','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17958');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (209,8,null,'Aerosol_nitrate_Special','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17959');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (210,8,null,'Soil gas CH4_2_A','ppb C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17960');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (211,8,null,'Suction_cup_Diss_N2O_conc_in_soil_water_depth1_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17961');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (212,8,null,'Additional_special_topics_Aerosol_nitrate_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17962');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (213,8,null,'Wet_total','mm',null,to_date('19-MAR-12','DD-MON-RR'),0,'17963');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (214,8,null,'SoilNH4_2_B','mg NH4 L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17964');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (215,8,null,'SoilNO3_1_B','mg NO3- L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17965');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (216,8,null,'Suction_cup_Diss_CH4_conc_in_soil_water_depth1_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17966');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (217,8,null,'Suction_cup_Soil_CH4_gas_conc_depth1_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17967');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (218,8,null,'Soil_NO3_depth_1b','kg N kg-1 dry soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'17968');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (219,8,null,'Soil water_CH4_1_B','ppb C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17969');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (220,8,null,'Soil gas N2O_2_A','ppb N',null,to_date('19-MAR-12','DD-MON-RR'),0,'17970');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (221,8,null,'Soil gas CH4 _1_B','ppb C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17971');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (222,8,null,'Suction_cup_Diss_N2O_conc_in_soil_water_depth2_site_B_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17972');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (223,8,null,'Suction_cup_Diss_CH4_conc_in_soil_water_depth1_site_A_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17973');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (224,8,null,'Aerosol_Ammonium_Special','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17974');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (225,8,null,'Extra_N_NO3-_NH4+_conc','mg N L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17975');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (226,8,null,'Extra_Soil_NO3_depth4','mg NO3- L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17976');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (227,8,null,'Extra_Soil_Total_N_depth2_conc','mg N L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17977');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (228,8,null,'Additional_special_topics_end_date',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17978');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (229,8,null,'Extra_Stemflow_total_N','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17979');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (230,8,null,'Extra_Soil_NH4_depth3','mg NH4 L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17980');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (231,8,null,'Additional_special_topics_Ammonia_and_ammonium_conc','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17981');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (232,8,null,'Extra_Measurement_end_date',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17982');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (233,8,null,'Extra_Reactive_N_flux','ppb by volume m  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17983');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (234,8,null,'Extra_Total_bulk_total_N','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17984');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (235,8,null,'Extra_Wet_total_N','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17985');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (236,8,null,'Extra_Throughfall_total_N','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17986');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (237,8,null,'Extra_Soil_NH4_depth4','mg NH4 L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17987');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (238,8,null,'Extra_Soil_NO3_depth3','mg NO3- L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17988');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (239,8,null,'Extra_Soil_Total_N_conc','mg N L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17989');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (240,8,null,'Extra_Soil_Total_N_depth3_conc','mg N L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17990');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (241,8,null,'Extra_Soil_Total_N_depth4_conc','mg N L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17991');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (242,8,null,'Extra_Soil_Total_N_litter_humus_mass_based_conc','g N kg-1 dry soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'17992');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (243,8,null,'Extra_Soil_Total_N_depth2_mass_based_conc','g N kg-1 dry soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'17993');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (244,8,null,'Additional_special_topics_NitricAcid_and_nitrate_conc','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17994');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (245,8,null,'Additional_special_topics_Ammonium_conc','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17995');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (360,8,null,'NOx_and_O3_NO2_conc_height1','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17710');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (361,8,null,'NOx_and_O3_NO2_conc_height2','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17711');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (362,8,null,'NOx_and_O3_NO2_conc_height4','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17712');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (363,8,null,'NOx_and_O3_NO2_conc_height5','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17713');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (364,8,null,'30_min_flux_Heat_storage_in_canopy_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17714');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (365,8,null,'30_min_flux_Roughness_length_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17715');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (366,8,null,'30_min_flux_Evapotranspiration_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17716');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (367,8,null,'30_min_met_Global_radiation_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17717');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (368,8,null,'30_min_met_Net_radiation_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17718');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (369,8,null,'30_min_met_PPFD_diffuse_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17719');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (370,8,null,'30_min_met_PPFD_global_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17720');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (371,8,null,'30_min_met_Pressure_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17721');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (372,8,null,'30_min_met_Canopy_temperature_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17722');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (373,8,null,'30_min_met_Bole_temperature_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17723');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (374,8,null,'30_min_met_Soil_temp_depth1_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17724');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (375,8,null,'30_min_met_Soil_temp_depth3_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17725');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (376,8,null,'30_min_met_Soil_H2O_depth1_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17726');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (377,8,null,'30_min_met_Soil_H2O_depth2_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17727');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (378,8,null,'30_min_met_Soil_H2O_depth3_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17728');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (379,8,null,'30_min_met_Soil_heat_flux_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17729');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (380,8,null,'30_min_met_Wind_direction_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17730');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (381,8,null,'30_min_met_Horizontal_windspeed_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17731');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (382,8,null,'30_min_met_Canopy_wetness_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17732');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (383,8,null,'Extra_flux_N2O_conc_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17733');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (384,8,null,'Extra_flux_NH3_conc_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17734');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (385,8,null,'WMS_Soil_NH4_conc_depth_2','g N kg-1 dry soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'17735');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (386,8,null,'WMS_Soil_NO3_conc_depth_2','g N kg-1 dry soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'17736');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (387,8,null,'WMS_LAI','m2  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17737');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (388,8,null,'WMS_Organic_fertilizer_total_C','%',null,to_date('19-MAR-12','DD-MON-RR'),0,'17738');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (389,8,null,'WMS_Organic_fertilizer_total_N','%',null,to_date('19-MAR-12','DD-MON-RR'),0,'17739');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (390,8,null,'Vegetation_height_before_cut','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17740');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (392,8,null,'Gap-filled_CO2_flux_storage_corrrected','umol C02 m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17742');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (393,8,null,'Latent_heat_flux','W  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17743');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (394,8,null,'Momentum_flux','kg  m-1  s-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17744');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (395,8,null,'Canopy_CO2_storage','umol C02 m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17745');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (396,8,null,'NO2_concentration_30_min','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17746');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (397,8,null,'Roughness_length','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17747');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (398,8,null,'Precipitation','mm',null,to_date('19-MAR-12','DD-MON-RR'),0,'17748');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (399,8,null,'Max_LAI',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17749');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (400,8,null,'Root_dry_biomass','g  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17750');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (401,8,null,'Wood_increment','kg  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17751');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (402,8,null,'Leaf_litter_production','kg  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17752');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (403,8,null,'Litter_fractions_depth ','mm',null,to_date('19-MAR-12','DD-MON-RR'),0,'17753');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (404,8,null,'Needle_C','% C dry matter',null,to_date('19-MAR-12','DD-MON-RR'),0,'17754');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (405,8,null,'Total_C_in_litter','%',null,to_date('19-MAR-12','DD-MON-RR'),0,'17755');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (406,8,null,'Inter_Crop_details',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17756');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (407,8,null,'Sowing_density','plant units  ha-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17757');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (408,8,null,'Peak_biomass','kg  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17758');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (409,8,null,'Legume_fraction',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17759');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (410,8,null,'Plant_species_2_cover',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17760');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (411,8,null,'Plant_species_3_cover',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17761');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (412,8,null,'Special_topics_start_date',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17762');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (413,8,null,'Special_topics_end_date',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17763');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (414,8,null,'Additional_special_topics_NitricAcid','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17764');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (415,8,null,'Additional_special_topics_Ammonium_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17765');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (416,8,null,'Additional_special_topics_Ammonia_and_Ammonium_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17766');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (417,8,null,'Additional_WMS_Soil_Total_N_at_depth_4_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17767');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (418,8,null,'Additional_WMS_Soil_Total_N_at_depth_3_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17768');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (419,8,null,'Additional_WMS_Soil_NO3_at_depth_4_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17769');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (420,8,null,'Additional_WMS_Soil_NO3_at_depth_3_depth ','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17770');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (246,8,null,'PPFD_diffuse','umol Quanta m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17996');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (247,8,null,'Pressure','kPa',null,to_date('19-MAR-12','DD-MON-RR'),0,'17997');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (248,8,null,'Bole_temperature','º  C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17998');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (249,8,null,'Soil_temperature_depth_2','º  C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17999');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (250,8,null,'Soil_water_content_2','m3 water m-3 soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'18000');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (251,8,null,'Water_table_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18001');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (252,8,null,'Canopy_wetness','%',null,to_date('19-MAR-12','DD-MON-RR'),0,'18002');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (253,8,null,'CH4_concentration_special','ng CH4 m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'18003');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (254,8,null,'N2O_flux_special','ng N m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'18004');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (255,8,null,'CH4_flux_special','ng CH4 m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'18005');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (256,8,null,'Throughfall_N_NO3','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'18006');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (257,8,null,'Stemflow_N_NO3','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'18007');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (258,8,null,'SoilNO3_2_A','mg NO3- L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'18008');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (259,8,null,'SoilNH4_1_B','mg NH4 L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'18009');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (260,8,null,'WMS_Leaf_N_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18010');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (261,8,null,'WMS_Bulk_wet_deposition_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18011');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (262,8,null,'WMS_Soil_CO2_Emission_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18012');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (263,8,null,'Fsoil_4_day_N2O_no_chambers',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'18013');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (264,8,null,'30_min_flux_H2O_conc_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18014');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (265,8,null,'30_min_met_Air_temperature_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18015');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (266,8,null,'30_min_met_Soil_temp_depth2_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18016');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (267,8,null,'30_min_met_Soil_temp_depth4_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18017');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (268,8,null,'30_min_met_Soil_H2O_depth4_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18018');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (269,8,null,'30_min_met_Relative_humidity_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18019');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (270,8,null,'30_min_met_Water_table_depth_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18020');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (271,8,null,'Extra_flux_CH4_conc_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18021');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (272,8,null,'Extra_flux_NO_flux_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18022');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (273,8,null,'WMS_Soil_NH4_conc_depth_1','g N kg-1 dry soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'18023');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (274,8,null,'WMS_Soil_NO3_conc_depth_1','g N kg-1 dry soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'18024');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (275,8,null,'WMS_NO3_leaching','mg NO3- L-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'18025');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (276,8,null,'WMS_Leaching_start_time',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'18026');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (277,8,null,'WMS_Mean_canopy_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'18027');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (278,8,null,'WMS_Aboveground_litter_mass','kg  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'18028');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (279,8,null,'WMS_plant_productivity_conts_grazing','kg  m-2  week-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'18029');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (280,8,null,'WMS_Standing_leaf_biomass','kg  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'18030');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (281,8,null,'WMS_Leaf_litter_production','kg  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'18031');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (282,8,null,'WMS_Organic_fertilizer_appl_method',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'18032');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (283,8,null,'WMS_Organic_fertilizer_form',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17633');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (284,8,null,'WMS_Organic_fertilizer_available_C','%',null,to_date('19-MAR-12','DD-MON-RR'),0,'17634');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (285,8,null,'WMS_Organic_fertilizer_available_N','%',null,to_date('19-MAR-12','DD-MON-RR'),0,'17635');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (286,8,null,'WMS_Organic_fertilizer_applied_N','kg N m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17636');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (287,8,null,'Stocking_density','Livestock Units  ha-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17637');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (288,8,null,'Yield','kg  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17638');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (289,8,null,'Tillage_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17639');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (290,8,null,'Pesticides',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17640');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (291,8,null,'CO2_concentration','umol C02 mol-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17641');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (292,8,41,'H20_concentration','mmol H20 mol-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17642');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (293,8,null,'Displacement_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17643');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (294,8,null,'Outgoing_longwave_radiation','W  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17644');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (295,8,null,'PPFD_global ','umol Quanta m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17645');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (296,8,null,'Air_temperature','º  C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17646');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (297,8,null,'Soil_water_content_1','m3 water m-2 soil',null,to_date('19-MAR-12','DD-MON-RR'),0,'17647');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (298,8,null,'Soil_heat_flux','W  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17648');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (299,8,null,'Horizontal_windspeed','m  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17649');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (300,8,null,'O3_flux_special','ng 03 m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17650');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (301,8,null,'Bulk_N_NH4','g N m-2  yr-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17651');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (302,8,null,'Suction_Wet_dep_end_date',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17652');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (303,8,null,'WMS_Soil_NH4_at_depth_1_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17653');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (304,8,null,'WMS_Nitrous_Oxide_flux_measure_height ','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17654');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (305,8,null,'WMS_LAI_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17655');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (306,8,null,'WMS_Mean_canopy_height_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17656');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (307,8,null,'WMS_Aboveground_biomass_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17657');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (308,8,null,'WMS_Potential_productivity_measure_height ','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17658');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (309,8,null,'Fsoil_4_day_CH4_no_chambers',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17659');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (310,8,null,'30_min_flux_Atmos_Stability_param_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17660');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (311,8,null,'30_min_flux_CO2_storage_in_canopy_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17661');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (312,8,null,'30_min_flux_NO2_conc_measure_height ','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17662');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (313,8,null,'30_min_flux_O3_conc_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17663');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (314,8,null,'30_min_flux_Displacement_height_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17664');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (315,8,21,'30_min_met_Precipitation_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17665');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (316,8,null,'30_min_met_Outgoing_shortwave_radiation_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17666');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (317,8,null,'30_min_met_Incoming_longwave_radiation_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17667');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (318,8,null,'30_min_met_Outgoing_longwave_radiation_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17668');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (319,8,null,'WMS_Soil_CO2_Emission','umol C02 m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17669');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (320,8,null,'WMS_Leaching_end_time',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17670');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (321,8,null,'WMS_Tissue_N','% N  dry matter',null,to_date('19-MAR-12','DD-MON-RR'),0,'17671');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (322,8,null,'WMS_Throughfall','mm',null,to_date('19-MAR-12','DD-MON-RR'),0,'17672');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (323,8,null,'WMS_Thinnings',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17673');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (324,8,null,'WMS_Organic_fertilizer_dry_matter',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17674');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (325,8,null,'WMS_N2O_flux','ug N m-2  h-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17675');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (326,8,null,'WMS_Aboveground_biomass','kg  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17676');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (327,8,null,'WMS_NO3_concn_in_soil_water_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17677');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (328,8,null,'WMS_Organic_fertilizer_applied_C','kg C m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17678');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (329,8,null,'Tillage',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17679');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (330,8,null,'Friction_velocity','m  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17680');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (331,8,null,'Canopy_heat_storage','W  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17681');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (332,8,null,'O3_concentration_30_min','ng  m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17682');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (333,8,null,'Outgoing_shortwave_radiation','W  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17683');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (334,8,null,'Canopy_temperature','yr C',null,to_date('19-MAR-12','DD-MON-RR'),0,'17684');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (335,8,null,'N2O_concentration_special','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17685');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (336,8,null,'NH3_flux_special','ng N m-2  s-1',null,to_date('19-MAR-12','DD-MON-RR'),0,'17686');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (337,8,null,'Bulk_total','mm',null,to_date('19-MAR-12','DD-MON-RR'),0,'17687');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (338,8,null,'Throughfall_total','mm',null,to_date('19-MAR-12','DD-MON-RR'),0,'17688');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (339,8,null,'WMS_Soil_NH4_at_depth_2_measure_depth ','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17689');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (340,8,null,'WMS_Soil_NO3_ at_depth_1_measure_depth','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17690');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (341,8,null,'WMS_Vegetation_height_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17691');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (342,8,null,'WMS_Other_events_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17692');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (343,8,null,'Fsoil_4_day_CO2_no_chambers',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17693');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (344,8,null,'30_min_flux_CO2_flux_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17694');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (345,8,null,'30_min_flux_Latent_heat_flux_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17695');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (346,8,null,'30_min_flux_Momentum_flux_measure_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17696');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (347,8,null,'Mean_canopy_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17697');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (348,8,null,'Wood_dry_biomass','g  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17698');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (349,8,null,'Aboveground_biomass','kg  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17699');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (350,8,null,'Total_N_in_litter','%',null,to_date('19-MAR-12','DD-MON-RR'),0,'17700');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (351,8,null,'Sowing_or_planting_date',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17701');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (352,8,null,'Yield_of_harvest','kg  m-2',null,to_date('19-MAR-12','DD-MON-RR'),0,'17702');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (353,8,null,'Grazing_conts_or_rotational',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17703');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (354,8,null,'Plant_species_4_cover',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17704');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (355,8,null,'Additional_special_topics_Nitrate_conc','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17705');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (356,8,null,'Additional_WMS_Soil_NH4_at_depth_4_depth ','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17706');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (357,8,null,'Additional_WMS_Bulk-dep_total_N_height','m',null,to_date('19-MAR-12','DD-MON-RR'),0,'17707');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (358,8,null,'Extra_conc_NO2_at_height6','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17708');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (359,8,null,'Extra_conc_NO_at_height3','ng N m-3',null,to_date('19-MAR-12','DD-MON-RR'),0,'17709');
Insert into ENCORE.PROJECTFIELD (ID,PROJECTID,FIELDID,NAME,UNIT,DESCRIPTION,CREATEDON,DELETED,SOURCEID) values (391,8,null,'Liming',null,null,to_date('19-MAR-12','DD-MON-RR'),0,'17741');
REM INSERTING into ENCORE.PROJECTSITE
SET DEFINE OFF;
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (1,8,null,'Test Site',null,null,null,to_date('06-NOV-11','DD-MON-RR'),0,null);
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (21,8,null,'Sue_Demo_Site_2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'505');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (22,8,null,'Aberdeen',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'549');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (23,8,null,'Sue_Solothurn_1',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'567');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (24,8,null,'Sue_Solothurn_4',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'570');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (25,8,null,'Sue_Test_Site_2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'586');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (26,8,null,'Sue_Test_Site_4',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'588');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (27,8,null,'Sue_Feb_Test_1',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'625');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (28,8,null,'AMo',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'647');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (29,8,null,'August_26_test_site_2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'685');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (30,8,null,'290910_test_site_2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'706');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (31,8,null,'110125_SueTest',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'805');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (32,8,null,'Tadham Moor',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'885');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (33,8,null,'C5_master_site',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'905');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (34,8,null,'110324_SUE_SITE',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'985');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (35,8,null,'Wales',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1086');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (36,8,null,'Northern Ireland',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1088');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (37,8,null,'ECLAIRE_demo_site_2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1166');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (38,8,null,'ECLAIRE_demo_site_5',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1187');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (39,8,null,'Test_site_for_null',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1205');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (40,8,null,'Sue_Demo_Site_3',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'525');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (41,8,null,'Sue_Demo_Site_5',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'547');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (42,8,null,'Bill_Solothurn',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'554');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (43,8,null,'Woodside',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'556');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (44,8,null,'Sue_Solothurn_report',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'565');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (45,8,null,'Sue_Solothurn_5',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'571');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (46,8,null,'Sue_Test_Site',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'585');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (47,8,null,'Sue_Test_Site_3',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'587');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (48,8,null,'GrimsburyWood',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'645');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (49,8,null,'290910_test_site_3',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'707');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (50,8,null,'110322_SUE_SITE',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'945');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (51,8,null,'Slough',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'947');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (52,8,null,'Bulgaria_Pachev',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1045');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (53,8,null,'Sharon Test Site',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1065');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (54,8,null,'ECLAIRE_demo_site',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1165');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (55,8,null,'ECLAIRE_demo_site_7',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1225');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (56,8,null,'Falköping',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'189');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (57,8,null,'Domboshawa Training Centre (DTC) Exp. 1',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'208');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (58,8,null,'Garraf',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'212');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (59,8,null,'Theix',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'218');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (60,8,null,'Beano',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'193');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (61,8,null,'Grignon',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'102');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (62,8,null,'Paulinenaue',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'203');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (63,8,null,'Bugac',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'106');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (64,8,null,'Easter Bush SW',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'109');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (65,8,null,'Lompolojankka',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'110');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (66,8,null,'Castellaro',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'111');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (67,8,21,'Gebesee',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'113');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (68,8,null,'Hoglwald',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'114');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (69,8,null,'Easter Bush NE',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'141');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (70,8,null,'Zimbabwe',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'207');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (71,8,null,'Grasslands research Station (GRS) Exp.3',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'209');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (72,8,null,'Fäjemyr',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'215');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (73,8,null,'Whim',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'216');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (74,8,null,'Rzecin (Demmin)',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'220');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (75,8,null,'Univ. of Zimbabwe Farm (UZF) Exp.3',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'245');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (76,8,null,'Auchencorth',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'108');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (77,8,null,'Alptal',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'183');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (78,8,null,'Vestskoven',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'185');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (79,8,null,'Tolfa',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'187');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (80,8,null,'Herdada de Mitra',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'188');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (81,8,null,'Gårdsjön',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'190');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (82,8,null,'Maulde',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'191');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (83,8,null,'Oldebroek',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'213');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (84,8,null,'Crichton',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'221');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (85,8,null,'Nafferton',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'223');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (86,8,null,'Domboshawa Training Centre (DTC) Exp. 2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'242');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (87,8,null,'Soroe',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'104');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (88,8,null,'Oensingen',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'107');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (89,8,null,'Piana del Sele',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'112');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (90,8,null,'Speulder',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'115');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (91,8,null,'Foulum',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'192');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (92,8,null,'Klosterhede',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'184');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (93,8,null,'Stroedam',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'186');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (94,8,null,'El Encin',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'194');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (95,8,null,'Petrodolinskoe',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'206');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (96,8,null,'Männikjärve',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'211');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (97,8,null,'Storflaket',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'214');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (98,8,null,'Clocaenog',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'217');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (99,8,null,'Univ. of Zimbabwe Farm (UZF) Exp.2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'243');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (100,8,null,'Hyytiala',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'105');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (101,8,null,'Brandbjerg',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'121');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (102,8,null,'Mols',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'161');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (103,8,null,'Klausenleopoldsdorf',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'162');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (104,8,null,'Achenkirchen',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'182');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (105,8,null,'Skogaryd',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'202');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (106,8,null,'Logården',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'204');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (107,8,null,'Tulloch',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'205');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (108,8,null,'Univ. of Zimbabwe Farm (UZF) Exp.1',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'210');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (109,8,null,'Gödöllö (SZIU)',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'219');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (110,8,null,'Peaknaze',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'222');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (111,8,null,'Test Site',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'262');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (112,8,null,'Sue_Demo_Site',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'282');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (113,8,null,'Sue_Demo_Site_4',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'546');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (114,8,null,'Pittodrie',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'551');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (115,8,null,'Sue_Solothurn',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'552');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (116,8,null,'David_Solothurn',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'553');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (117,8,null,'Rory_Solothurn',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'555');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (118,8,null,'David_Solothurn_2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'566');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (119,8,null,'Sue_Solothurn_2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'568');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (120,8,null,'Sue_Solothurn_6',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'572');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (121,8,null,'Sue_Test_Site_5',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'589');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (122,8,null,'Sue_Test_Site_6',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'590');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (123,8,null,'Sue_Demo_Site_8',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'606');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (124,8,null,'EBu',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'646');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (125,8,null,'August_26_test_site',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'665');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (126,8,null,'300910_Test_Site_2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'726');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (127,8,null,'300910_Test_Site_3',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'727');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (128,8,null,'131010_Site',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'745');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (129,8,null,'151010_site',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'765');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (130,8,null,'110124_SueTest',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'785');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (131,8,null,'110126_SueTest',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'806');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (132,8,null,'110127_SueTest',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'825');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (133,8,null,'C5_model_1',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'906');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (134,8,null,'Reading',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'946');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (135,8,null,'110323_SUE_SITE',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'965');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (136,8,22,'Speulder_test',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1005');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (137,8,null,'110330_SUE_SITE',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1025');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (138,8,null,'England',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1085');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (139,8,null,'Scotland',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1087');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (140,8,null,'UK',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1089');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (141,8,null,'110928_permissions_1',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1105');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (142,8,null,'110928_permissions_2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1106');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (143,8,null,'110930_permissions_3',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1125');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (144,8,null,'111014_Permissions_1',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1145');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (145,8,null,'ECLAIRE_demo_site_4',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1185');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (146,8,null,'ECLAIRE_demo_site_3',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1186');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (147,8,null,'ECLAIRE_demo_site_6',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1188');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (148,8,null,'120120_Suetest',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1245');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (149,8,null,'C2 Test Site',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'485');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (150,8,null,'C2 Test Site 2',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'545');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (151,8,null,'Sue_Demo_Site_6',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'548');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (152,8,null,'Aberdeen City',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'550');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (153,8,null,'Sue_Solothurn_3',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'569');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (154,8,null,'Sue_Solothurn_7',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'573');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (155,8,null,'Sue_Demo_Site_7',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'605');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (156,8,null,'290910_test_site_1',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'705');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (157,8,null,'300910_Test_Site_1',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'725');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (158,8,null,'110217_SueTest',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'845');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (159,8,null,'110321_SUE_SITE',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'925');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (160,8,null,'Bracknell',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'948');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (161,8,null,'2009i_defor',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1265');
Insert into ENCORE.PROJECTSITE (ID,PROJECTID,SITEID,NAME,DESCRIPTION,LATITUDE,LONGITUDE,CREATEDON,DELETED,SOURCEID) values (162,8,null,'Owen et al 2011',null,null,null,to_date('19-MAR-12','DD-MON-RR'),0,'1285');
REM INSERTING into ENCORE.PROJECTSITESUMMARY
SET DEFINE OFF;
REM INSERTING into ENCORE.REPORT
SET DEFINE OFF;
Insert into ENCORE.REPORT (ID,NAME,REQUESTSTATUS,LASTDATAREQUESTDATE,CREATEDON,DELETED,MODIFIEDON,SYSTEMUSERID,REPORTDATEFROM,REPORTDATETO) values (3,'Test Report Too','New',null,to_date('06-NOV-11','DD-MON-RR'),1,to_date('06-NOV-11','DD-MON-RR'),2,to_date('06-NOV-11','DD-MON-RR'),to_date('07-NOV-11','DD-MON-RR'));
Insert into ENCORE.REPORT (ID,NAME,REQUESTSTATUS,LASTDATAREQUESTDATE,CREATEDON,DELETED,MODIFIEDON,SYSTEMUSERID,REPORTDATEFROM,REPORTDATETO) values (4,'Test Report Too','New',null,to_date('06-NOV-11','DD-MON-RR'),1,to_date('06-NOV-11','DD-MON-RR'),2,to_date('06-NOV-11','DD-MON-RR'),to_date('07-NOV-11','DD-MON-RR'));
Insert into ENCORE.REPORT (ID,NAME,REQUESTSTATUS,LASTDATAREQUESTDATE,CREATEDON,DELETED,MODIFIEDON,SYSTEMUSERID,REPORTDATEFROM,REPORTDATETO) values (5,'Test Report Too','New',null,to_date('06-NOV-11','DD-MON-RR'),1,to_date('06-NOV-11','DD-MON-RR'),2,to_date('06-NOV-11','DD-MON-RR'),to_date('06-NOV-11','DD-MON-RR'));
Insert into ENCORE.REPORT (ID,NAME,REQUESTSTATUS,LASTDATAREQUESTDATE,CREATEDON,DELETED,MODIFIEDON,SYSTEMUSERID,REPORTDATEFROM,REPORTDATETO) values (6,'Test Report Too','New',null,to_date('06-NOV-11','DD-MON-RR'),1,to_date('06-NOV-11','DD-MON-RR'),2,to_date('06-NOV-11','DD-MON-RR'),to_date('06-NOV-11','DD-MON-RR'));
Insert into ENCORE.REPORT (ID,NAME,REQUESTSTATUS,LASTDATAREQUESTDATE,CREATEDON,DELETED,MODIFIEDON,SYSTEMUSERID,REPORTDATEFROM,REPORTDATETO) values (7,'Test Report Too','New',null,to_date('06-NOV-11','DD-MON-RR'),1,to_date('06-NOV-11','DD-MON-RR'),2,to_date('06-NOV-11','DD-MON-RR'),to_date('06-NOV-11','DD-MON-RR'));
Insert into ENCORE.REPORT (ID,NAME,REQUESTSTATUS,LASTDATAREQUESTDATE,CREATEDON,DELETED,MODIFIEDON,SYSTEMUSERID,REPORTDATEFROM,REPORTDATETO) values (2,'Test Report','Complete',null,to_date('02-NOV-11','DD-MON-RR'),0,to_date('25-MAR-12','DD-MON-RR'),2,to_date('01-JAN-00','DD-MON-RR'),to_date('03-NOV-11','DD-MON-RR'));
REM INSERTING into ENCORE.REPORTFIELD
SET DEFINE OFF;
Insert into ENCORE.REPORTFIELD (ID,REPORTID,FIELDID,FIELDORDER,ALIAS,FILTEROPERATOR,FILTERVALUE,FILTERFIELDID) values (2,0,2,0,null,null,null,null);
Insert into ENCORE.REPORTFIELD (ID,REPORTID,FIELDID,FIELDORDER,ALIAS,FILTEROPERATOR,FILTERVALUE,FILTERFIELDID) values (22,2,41,0,null,null,null,null);
REM INSERTING into ENCORE.REPORTPROJECTREQUEST
SET DEFINE OFF;
Insert into ENCORE.REPORTPROJECTREQUEST (ID,REPORTID,PROJECTID,STATUS,CREATEDON) values (10,2,8,'Complete',to_date('25-MAR-12','DD-MON-RR'));
REM INSERTING into ENCORE.REPORTSITE
SET DEFINE OFF;
Insert into ENCORE.REPORTSITE (ID,REPORTID,SITEID) values (2,0,1);
Insert into ENCORE.REPORTSITE (ID,REPORTID,SITEID) values (22,2,22);
REM INSERTING into ENCORE.SITE
SET DEFINE OFF;
Insert into ENCORE.SITE (ID,NAME,DESCRIPTION,CREATEDON,MODIFIEDON,DELETED,LATITUDE,LONGITUDE,GMTOFFSET,COUNTRY,ELEVATION,SITETYPEID) values (21,'Gebesee','Test test test',to_date('19-MAR-12','DD-MON-RR'),to_date('19-MAR-12','DD-MON-RR'),0,null,null,null,null,null,null);
Insert into ENCORE.SITE (ID,NAME,DESCRIPTION,CREATEDON,MODIFIEDON,DELETED,LATITUDE,LONGITUDE,GMTOFFSET,COUNTRY,ELEVATION,SITETYPEID) values (1,'Test Site','This is a description',to_date('30-OCT-11','DD-MON-RR'),to_date('30-OCT-11','DD-MON-RR'),0,0,0,null,null,null,null);
Insert into ENCORE.SITE (ID,NAME,DESCRIPTION,CREATEDON,MODIFIEDON,DELETED,LATITUDE,LONGITUDE,GMTOFFSET,COUNTRY,ELEVATION,SITETYPEID) values (22,'Speulder_test','Test site with data',to_date('20-MAR-12','DD-MON-RR'),to_date('20-MAR-12','DD-MON-RR'),0,null,null,null,null,null,null);
REM INSERTING into ENCORE.SITECONTACT
SET DEFINE OFF;
REM INSERTING into ENCORE.SITETYPE
SET DEFINE OFF;
Insert into ENCORE.SITETYPE (ID,NAME) values (1,'Arable');
Insert into ENCORE.SITETYPE (ID,NAME) values (2,'Forest');
Insert into ENCORE.SITETYPE (ID,NAME) values (3,'Grassland');
Insert into ENCORE.SITETYPE (ID,NAME) values (4,'Shrub Land');
Insert into ENCORE.SITETYPE (ID,NAME) values (5,'Wetland');
REM INSERTING into ENCORE.SYSTEMUSER
SET DEFINE OFF;
Insert into ENCORE.SYSTEMUSER (ID,NAME,EMAIL,PASSWORD,CREATEDON,MODIFIEDON,DELETED,LASTLOGGEDON,ADMINISTRATOR,ORGANISATION,ORGANISATIONURL,COUNTRY,AREAOFRESEARCH,URL,TWITTER,FACEBOOK,LINKEDIN) values (2,'Rory Wilson','rory.wilson@gmail.com','password',to_date('23-SEP-11','DD-MON-RR'),to_date('23-SEP-11','DD-MON-RR'),0,to_date('25-MAR-12','DD-MON-RR'),1,null,null,null,null,null,null,null,null);
Insert into ENCORE.SYSTEMUSER (ID,NAME,EMAIL,PASSWORD,CREATEDON,MODIFIEDON,DELETED,LASTLOGGEDON,ADMINISTRATOR,ORGANISATION,ORGANISATIONURL,COUNTRY,AREAOFRESEARCH,URL,TWITTER,FACEBOOK,LINKEDIN) values (21,'Test User','test@test.com','password',to_date('30-OCT-11','DD-MON-RR'),to_date('01-JAN-01','DD-MON-RR'),0,to_date('30-OCT-11','DD-MON-RR'),0,null,null,null,null,null,null,null,null);
REM INSERTING into ENCORE.UNIT
SET DEFINE OFF;
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (81,'NO3-','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (83,'HH:MM','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (82,'L-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (84,'s-2','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (85,'kPa','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (80,'ug','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (87,'molar','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (86,'Number','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (88,'ppb','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (89,'NH4','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (1,'%','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (2,'cm','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (3,'DD/MM/YY','DateTime',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (4,'g','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (5,'kg','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (6,'l (litres)','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (7,'Livestock Units','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (8,'m','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (9,'m2','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (10,'m3','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (11,'mg','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (21,'mm','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (22,'mm ','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (23,'umol','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (24,'mmol','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (25,'ng','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (26,'º ','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (27,'plant units','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (28,'ppm','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (29,'stems','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (30,'W','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (31,'yr','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (32,'available C','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (33,'available N','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (34,'biomass N','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (35,'by dry biomass','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (36,'by volume','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (37,'by weight','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (38,'Number','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (39,'C dry matter','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (40,'CH4','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (41,'CH4-C','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (42,'C02','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (43,'C02-C','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (44,'cover','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (45,'dry matter','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (46,'H20','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (47,'K','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (48,'N','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (49,'N20-N','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (50,'NH3-N','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (51,'N02-N','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (52,'N0-N','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (53,'03','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (54,'P','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (55,'Quanta','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (56,'Soil','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (57,'to DD/MM/YY','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (58,'water','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (59,'cm-3','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (60,'d-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (61,'g-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (62,'h-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (63,'ha-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (64,'kg-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (65,'m-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (66,'m-2','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (67,'m-3','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (68,'mol-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (69,'s-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (70,'dry matter','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (71,'dry soil','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (72,'N','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (73,'soil','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (74,'h-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (75,'MPa-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (76,'s-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (77,'min-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (78,'week-1','Number',null);
Insert into ENCORE.UNIT (ID,NAME,DATATYPE,DESCRIPTION) values (79,'yr-1','Number',null);
REM INSERTING into ENCORE.VWFIELDGROUPFIELD
SET DEFINE OFF;
Insert into ENCORE.VWFIELDGROUPFIELD (ID,FIELDGROUPID,NAME) values (2,1,'Meters');
Insert into ENCORE.VWFIELDGROUPFIELD (ID,FIELDGROUPID,NAME) values (3,1,'Distance');
REM INSERTING into ENCORE.VWFIELDUNIT
SET DEFINE OFF;
Insert into ENCORE.VWFIELDUNIT (ID,NAME,UNITID,UNITNAME,DATATYPE,DESCRIPTION) values (21,'Precipitation',2,'cm','Number','asdadads');
Insert into ENCORE.VWFIELDUNIT (ID,NAME,UNITID,UNITNAME,DATATYPE,DESCRIPTION) values (2,'Meters',8,'m','Number','asSas');
Insert into ENCORE.VWFIELDUNIT (ID,NAME,UNITID,UNITNAME,DATATYPE,DESCRIPTION) values (3,'Distance',1,'%','Number',null);
Insert into ENCORE.VWFIELDUNIT (ID,NAME,UNITID,UNITNAME,DATATYPE,DESCRIPTION) values (41,'H20_concentration',1,'%','Number',null);
REM INSERTING into ENCORE.VWREPORTFIELD
SET DEFINE OFF;
Insert into ENCORE.VWREPORTFIELD (ID,REPORTID,FIELDORDER,NAME) values (2,0,0,'Meters');
Insert into ENCORE.VWREPORTFIELD (ID,REPORTID,FIELDORDER,NAME) values (41,2,0,'H20_concentration');
REM INSERTING into ENCORE.VWREPORTSITE
SET DEFINE OFF;
Insert into ENCORE.VWREPORTSITE (ID,REPORTID,NAME) values (1,0,'Test Site');
Insert into ENCORE.VWREPORTSITE (ID,REPORTID,NAME) values (22,2,'Speulder_test');
--------------------------------------------------------
--  DDL for Index AUDITLOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."AUDITLOG_PK" ON "ENCORE"."AUDITLOG" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FIELDGROUPFIELD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."FIELDGROUPFIELD_PK" ON "ENCORE"."FIELDGROUPFIELD" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FIELDGROUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."FIELDGROUP_PK" ON "ENCORE"."FIELDGROUP" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FIELD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."FIELD_PK" ON "ENCORE"."FIELD" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROJECTFIELD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."PROJECTFIELD_PK" ON "ENCORE"."PROJECTFIELD" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROJECTSITESUMMARY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."PROJECTSITESUMMARY_PK" ON "ENCORE"."PROJECTSITESUMMARY" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROJECTSITE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."PROJECTSITE_PK" ON "ENCORE"."PROJECTSITE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PROJECT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."PROJECT_PK" ON "ENCORE"."PROJECT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REPORTFIELD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."REPORTFIELD_PK" ON "ENCORE"."REPORTFIELD" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REPORTPROJECTREQUEST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."REPORTPROJECTREQUEST_PK" ON "ENCORE"."REPORTPROJECTREQUEST" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REPORTSITE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."REPORTSITE_PK" ON "ENCORE"."REPORTSITE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REPORT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."REPORT_PK" ON "ENCORE"."REPORT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SITECONTACT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."SITECONTACT_PK" ON "ENCORE"."SITECONTACT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SITETYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."SITETYPE_PK" ON "ENCORE"."SITETYPE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SITE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."SITE_PK" ON "ENCORE"."SITE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYSTEMUSER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."SYSTEMUSER_PK" ON "ENCORE"."SYSTEMUSER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index UNIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENCORE"."UNIT_PK" ON "ENCORE"."UNIT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table AUDITLOG
--------------------------------------------------------

  ALTER TABLE "ENCORE"."AUDITLOG" ADD CONSTRAINT "AUDITLOG_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."AUDITLOG" MODIFY ("SYSTEMUSERID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."AUDITLOG" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."AUDITLOG" MODIFY ("AUDITTYPE" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."AUDITLOG" MODIFY ("SOURCE" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."AUDITLOG" MODIFY ("CREATEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."AUDITLOG" MODIFY ("DELETED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FIELD
--------------------------------------------------------

  ALTER TABLE "ENCORE"."FIELD" ADD CONSTRAINT "FIELD_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."FIELD" MODIFY ("UNITID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."FIELD" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."FIELD" MODIFY ("CREATEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."FIELD" MODIFY ("MODIFIEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."FIELD" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FIELDGROUP
--------------------------------------------------------

  ALTER TABLE "ENCORE"."FIELDGROUP" ADD CONSTRAINT "FIELDGROUP_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."FIELDGROUP" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."FIELDGROUP" MODIFY ("CREATEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."FIELDGROUP" MODIFY ("MODIFIEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."FIELDGROUP" MODIFY ("DELETED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FIELDGROUPFIELD
--------------------------------------------------------

  ALTER TABLE "ENCORE"."FIELDGROUPFIELD" ADD CONSTRAINT "FIELDGROUPFIELD_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."FIELDGROUPFIELD" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROJECT
--------------------------------------------------------

  ALTER TABLE "ENCORE"."PROJECT" ADD CONSTRAINT "PROJECT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."PROJECT" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECT" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECT" MODIFY ("CREATEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECT" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECT" MODIFY ("SYSTEMUSERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROJECTFIELD
--------------------------------------------------------

  ALTER TABLE "ENCORE"."PROJECTFIELD" ADD CONSTRAINT "PROJECTFIELD_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."PROJECTFIELD" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTFIELD" MODIFY ("PROJECTID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTFIELD" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTFIELD" MODIFY ("CREATEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTFIELD" MODIFY ("DELETED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROJECTSITE
--------------------------------------------------------

  ALTER TABLE "ENCORE"."PROJECTSITE" ADD CONSTRAINT "PROJECTSITE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."PROJECTSITE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTSITE" MODIFY ("PROJECTID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTSITE" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTSITE" MODIFY ("CREATEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTSITE" MODIFY ("DELETED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROJECTSITESUMMARY
--------------------------------------------------------

  ALTER TABLE "ENCORE"."PROJECTSITESUMMARY" ADD CONSTRAINT "PROJECTSITESUMMARY_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."PROJECTSITESUMMARY" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTSITESUMMARY" MODIFY ("PROJECTID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTSITESUMMARY" MODIFY ("SITEID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTSITESUMMARY" MODIFY ("FIELDID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTSITESUMMARY" MODIFY ("ROWCOUNT" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTSITESUMMARY" MODIFY ("CREATEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."PROJECTSITESUMMARY" MODIFY ("MODIFIEDON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPORT
--------------------------------------------------------

  ALTER TABLE "ENCORE"."REPORT" ADD CONSTRAINT "REPORT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."REPORT" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORT" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORT" MODIFY ("CREATEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORT" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORT" MODIFY ("MODIFIEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORT" MODIFY ("SYSTEMUSERID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORT" MODIFY ("REPORTDATEFROM" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORT" MODIFY ("REPORTDATETO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPORTFIELD
--------------------------------------------------------

  ALTER TABLE "ENCORE"."REPORTFIELD" ADD CONSTRAINT "REPORTFIELD_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."REPORTFIELD" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORTFIELD" MODIFY ("REPORTID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORTFIELD" MODIFY ("FIELDID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPORTPROJECTREQUEST
--------------------------------------------------------

  ALTER TABLE "ENCORE"."REPORTPROJECTREQUEST" ADD CONSTRAINT "REPORTPROJECTREQUEST_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."REPORTPROJECTREQUEST" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORTPROJECTREQUEST" MODIFY ("REPORTID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORTPROJECTREQUEST" MODIFY ("PROJECTID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORTPROJECTREQUEST" MODIFY ("STATUS" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORTPROJECTREQUEST" MODIFY ("CREATEDON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPORTSITE
--------------------------------------------------------

  ALTER TABLE "ENCORE"."REPORTSITE" ADD CONSTRAINT "REPORTSITE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."REPORTSITE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORTSITE" MODIFY ("REPORTID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."REPORTSITE" MODIFY ("SITEID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SITE
--------------------------------------------------------

  ALTER TABLE "ENCORE"."SITE" ADD CONSTRAINT "SITE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."SITE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SITE" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SITE" MODIFY ("CREATEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SITE" MODIFY ("MODIFIEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SITE" MODIFY ("DELETED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SITECONTACT
--------------------------------------------------------

  ALTER TABLE "ENCORE"."SITECONTACT" ADD CONSTRAINT "SITECONTACT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."SITECONTACT" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SITECONTACT" MODIFY ("SYSTEMUSERID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SITECONTACT" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SITECONTACT" MODIFY ("CREATEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SITECONTACT" MODIFY ("MODIFIEDON" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SITETYPE
--------------------------------------------------------

  ALTER TABLE "ENCORE"."SITETYPE" ADD CONSTRAINT "SITETYPE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."SITETYPE" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SITETYPE" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SYSTEMUSER
--------------------------------------------------------

  ALTER TABLE "ENCORE"."SYSTEMUSER" ADD CONSTRAINT "SYSTEMUSER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "ENCORE"."SYSTEMUSER" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SYSTEMUSER" MODIFY ("LASTLOGGEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SYSTEMUSER" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SYSTEMUSER" MODIFY ("EMAIL" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SYSTEMUSER" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SYSTEMUSER" MODIFY ("CREATEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SYSTEMUSER" MODIFY ("MODIFIEDON" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SYSTEMUSER" MODIFY ("DELETED" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."SYSTEMUSER" MODIFY ("ADMINISTRATOR" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UNIT
--------------------------------------------------------

  ALTER TABLE "ENCORE"."UNIT" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."UNIT" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."UNIT" MODIFY ("DATATYPE" NOT NULL ENABLE);
 
  ALTER TABLE "ENCORE"."UNIT" ADD CONSTRAINT "UNIT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;

















--------------------------------------------------------
--  DDL for Trigger SITETYPE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."SITETYPE_TRG" BEFORE INSERT ON SITETYPE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT SITETYPE_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ENCORE"."SITETYPE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_AUDITLOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_AUDITLOG" before insert on AUDITLOG for each row 
begin select seq_AUDITLOG.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_AUDITLOG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_FIELD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_FIELD" before insert on FIELD for each row 
begin select seq_FIELD.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_FIELD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_FIELDGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_FIELDGROUP" before insert on FIELDGROUP for each row 
begin select seq_FIELDGROUP.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_FIELDGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_FIELDGROUPFIELD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_FIELDGROUPFIELD" before insert on FIELDGROUPFIELD for each row 
begin select seq_FIELDGROUPFIELD.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_FIELDGROUPFIELD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PROJECT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_PROJECT" before insert on PROJECT for each row 
begin select seq_PROJECT.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_PROJECT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PROJECTFIELD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_PROJECTFIELD" before insert on PROJECTFIELD for each row 
begin select seq_PROJECTFIELD.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_PROJECTFIELD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PROJECTSITE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_PROJECTSITE" before insert on PROJECTSITE for each row 
begin select seq_PROJECTSITE.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_PROJECTSITE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PROJECTSITESUMMARY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_PROJECTSITESUMMARY" before insert on PROJECTSITESUMMARY for each row 
begin select seq_PROJECTSITESUMMARY.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_PROJECTSITESUMMARY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_REPORT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_REPORT" before insert on REPORT for each row 
begin select seq_REPORT.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_REPORT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_REPORTFIELD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_REPORTFIELD" before insert on REPORTFIELD for each row 
begin select seq_REPORTFIELD.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_REPORTFIELD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_REPORTPROJECTREQUEST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_REPORTPROJECTREQUEST" before insert on REPORTPROJECTREQUEST for each row 
begin select seq_REPORTPROJECTREQUEST.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_REPORTPROJECTREQUEST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_REPORTSITE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_REPORTSITE" before insert on REPORTSITE for each row 
begin select seq_REPORTSITE.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_REPORTSITE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_SITE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_SITE" before insert on SITE for each row 
begin select seq_SITE.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_SITE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_SITECONTACT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_SITECONTACT" before insert on SITECONTACT for each row 
begin select seq_SITECONTACT.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_SITECONTACT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_SYSTEMUSER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."TRG_SYSTEMUSER" before insert on SYSTEMUSER for each row 
begin select seq_SYSTEMUSER.nextval into :new.id from dual;
end;
/
ALTER TRIGGER "ENCORE"."TRG_SYSTEMUSER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UNIT_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ENCORE"."UNIT_TRG" BEFORE INSERT ON UNIT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF :NEW.ID IS NULL THEN
      SELECT UNIT_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ENCORE"."UNIT_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure SPCLEARFIELDGROUPFIELDS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ENCORE"."SPCLEARFIELDGROUPFIELDS" (GROUP_ID NUMBER) AS
   BEGIN
      DELETE FROM FIELDGROUPFIELD
      WHERE FIELDGROUPID = GROUP_ID;
   END;

/

--------------------------------------------------------
--  DDL for Procedure SPCLEARREPORTFIELDS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ENCORE"."SPCLEARREPORTFIELDS" (REPORT_ID NUMBER) AS
   BEGIN
      DELETE FROM REPORTFIELD
      WHERE REPORTID = REPORT_ID;
   END;

/

--------------------------------------------------------
--  DDL for Procedure SPCLEARREPORTSITES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "ENCORE"."SPCLEARREPORTSITES" (REPORT_ID NUMBER) AS
   BEGIN
      DELETE FROM REPORTSITE
      WHERE REPORTID = REPORT_ID;
   END;

/

