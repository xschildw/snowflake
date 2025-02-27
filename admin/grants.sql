USE ROLE SECURITYADMIN;
-- ACCOUNTADMIN privileges
GRANT ROLE ACCOUNTADMIN
TO USER "x.schildwachter@sagebase.org";
GRANT ROLE ACCOUNTADMIN
TO USER "khai.do@sagebase.org";

-- SYSADMIN privileges
GRANT ROLE SYSADMIN
TO USER "kevin.boske@sagebase.org";
GRANT ROLE SYSADMIN
TO USER "x.schildwachter@sagebase.org";
GRANT ROLE SYSADMIN
TO USER DPE_SERVICE;
-- warehouse usage privileges
GRANT USAGE ON WAREHOUSE COMPUTE_XSMALL
TO ROLE DATA_ANALYTICS;

-- public grants
GRANT USAGE ON DATABASE SAGE
TO ROLE PUBLIC;
GRANT USAGE ON SCHEMA SAGE.PORTAL_RAW
TO ROLE PUBLIC;
GRANT SELECT ON FUTURE TABLES IN SCHEMA SAGE.PORTAL_RAW
TO ROLE PUBLIC;

-- GENIE privileges
GRANT ROLE GENIE_ADMIN
TO ROLE USERADMIN;
GRANT ROLE GENIE_ADMIN
TO USER "alexander.paynter@sagebase.org";
GRANT ROLE GENIE_ADMIN
TO USER "xindi.guo@sagebase.org";
GRANT ROLE GENIE_ADMIN
TO USER "chelsea.nayan@sagebase.org";

-- RECOVER privileges
GRANT ROLE RECOVER_DATA_ENGINEER
TO ROLE USERADMIN;
GRANT ROLE RECOVER_DATA_ANALYTICS
TO ROLE USERADMIN;
GRANT ROLE RECOVER_DATA_ENGINEER
TO USER "phil.snyder@sagebase.org";
GRANT ROLE RECOVER_DATA_ENGINEER
TO USER "rixing.xu@sagebase.org";
GRANT ROLE RECOVER_DATA_ENGINEER
TO USER "thomas.yu@sagebase.org";

-- AD privileges
GRANT ROLE AD
TO ROLE USERADMIN;
GRANT ROLE AD
TO USER "abby.vanderlinden@sagebase.org";
GRANT ROLE AD
TO USER DBT_SERVICE;

-- Data engineer privileges
GRANT ROLE DATA_ENGINEER
TO ROLE USERADMIN;
GRANT ROLE DATA_ENGINEER
TO USER "phil.snyder@sagebase.org";
GRANT ROLE DATA_ENGINEER
TO USER "rixing.xu@sagebase.org";
GRANT ROLE DATA_ENGINEER
TO USER "thomas.yu@sagebase.org";
GRANT ROLE DATA_ENGINEER
TO USER "brad.macdonald@sagebase.org";
GRANT ROLE DATA_ENGINEER
TO USER "bryan.fauble@sagebase.org";
GRANT ROLE DATA_ENGINEER
TO USER "nick.grosenbacher@sagebase.org";
GRANT ROLE DATA_ENGINEER
TO USER "jenny.medina@sagebase.org";
GRANT ROLE DATA_ENGINEER
TO USER DPE_SERVICE;

-- data analytics privileges
GRANT ROLE DATA_ANALYTICS TO USER "diep.thach@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "rixing.xu@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "thomas.yu@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "anh.nguyet.vu@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "luca.foschini@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "xindi.guo@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "abby.vanderlinden@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "phil.snyder@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "chelsea.nayan@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "alexander.paynter@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "x.schildwachter@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "natosha.edmonds@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "kevin.boske@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "brad.macdonald@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "robert.allaway@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "nicholas.lee@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "victor.baham@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "meghasyam@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "pranav.anbarasu@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "elias.chaibub.neto@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "bryan.fauble@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "john.hill@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "bruce.hoff@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "marco.marasca@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "sandhra.sokhal@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "adam.hindman@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "jessica.malenfant@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "pierrette.lo@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "ann.novakowski@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "christine.suver@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "adam.taylor@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "sophia.jobe@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "thomas.schaffter@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "jake.albrecht@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "solly.sieberts@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "arti.singh@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "dan.lu@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "jessica.britton@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "christina.conrad@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "drew.duglan@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "zoe.leanza@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "anna.greenwood@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "jay.hodgson@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "james.eddy@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "milan.vu@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "richard.yaxley@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "ashley.clayton@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "verena.chung@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "jineta.banerjee@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "sarah.chan@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "jenny.medina@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "lakaija.johnson@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "sonia.carlson@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "anthony.williams@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "loren.wolfe@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "lingling.peng@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "mialy.defelice@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "gianna.jordan@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "mieko.hashimoto@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "andrew.lamb@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "milen.nikolov@sagebase.org";
GRANT ROLE DATA_ANALYTICS TO USER "amy.heiser@sagebase.org";


GRANT ROLE FAIR TO USER "anthony.williams@sagebase.org";
GRANT ROLE FAIR TO USER "loren.wolfe@sagebase.org";
GRANT ROLE FAIR TO USER "lingling.peng@sagebase.org";
GRANT ROLE FAIR TO USER "mialy.defelice@sagebase.org";
GRANT ROLE FAIR TO USER "gianna.jordan@sagebase.org";
GRANT ROLE FAIR TO USER "mieko.hashimoto@sagebase.org";
GRANT ROLE FAIR TO USER "andrew.lamb@sagebase.org";
GRANT ROLE FAIR TO USER "milen.nikolov@sagebase.org";
GRANT ROLE FAIR TO USER "amy.heiser@sagebase.org";

-- Create governance privileges
GRANT ROLE MASKING_ADMIN
TO USER "thomas.yu@sagebase.org";
USE ROLE ACCOUNTADMIN;
GRANT APPLY MASKING POLICY ON ACCOUNT
TO ROLE MASKING_ADMIN;


-- Synapse data warehouse privileges
GRANT USAGE ON INTEGRATION SYNAPSE_PROD_WAREHOUSE_S3
TO ROLE SYSADMIN;
GRANT USAGE ON INTEGRATION SYNAPSE_PROD_WAREHOUSE_S3
TO ROLE DATA_ENGINEER;

USE ROLE SECURITYADMIN;
GRANT CREATE SCHEMA, USAGE ON DATABASE SYNAPSE_DATA_WAREHOUSE
TO ROLE DATA_ENGINEER;

GRANT ALL PRIVILEGES ON FUTURE SCHEMAS IN DATABASE SYNAPSE_DATA_WAREHOUSE
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON FUTURE TABLES IN DATABASE SYNAPSE_DATA_WAREHOUSE
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON FUTURE STAGES IN DATABASE SYNAPSE_DATA_WAREHOUSE
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON ALL TABLES IN DATABASE SYNAPSE_DATA_WAREHOUSE
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON ALL STAGES IN DATABASE SYNAPSE_DATA_WAREHOUSE
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON FUTURE STREAMS IN DATABASE SYNAPSE_DATA_WAREHOUSE
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON ALL STREAMS IN DATABASE SYNAPSE_DATA_WAREHOUSE
TO ROLE DATA_ENGINEER;

GRANT CREATE MASKING POLICY ON SCHEMA SYNAPSE_DATA_WAREHOUSE.SYNAPSE
TO ROLE MASKING_ADMIN;

-- Allow for data engineer role to create tasks
-- https://docs.snowflake.com/en/user-guide/tasks-intro#creating-tasks
USE ROLE ACCOUNTADMIN;
GRANT EXECUTE MANAGED TASK ON ACCOUNT TO ROLE DATA_ENGINEER; --noqa: PRS
GRANT CREATE DATABASE ON ACCOUNT TO ROLE DATA_ENGINEER; --noqa: PRS

USE ROLE SECURITYADMIN;
GRANT CREATE TASK ON SCHEMA SYNAPSE_DATA_WAREHOUSE.SYNAPSE_RAW
TO ROLE DATA_ENGINEER;
GRANT CREATE TASK ON SCHEMA SYNAPSE_DATA_WAREHOUSE_DEV.SYNAPSE_RAW
TO ROLE DATA_ENGINEER;

-- data analytics role
GRANT USAGE ON DATABASE SYNAPSE_DATA_WAREHOUSE
TO ROLE DATA_ANALYTICS;
GRANT USAGE ON SCHEMA SYNAPSE_DATA_WAREHOUSE.SYNAPSE
TO ROLE DATA_ANALYTICS;
GRANT SELECT ON FUTURE TABLES IN SCHEMA SYNAPSE_DATA_WAREHOUSE.SYNAPSE
TO ROLE DATA_ANALYTICS;

-- Synapse data warehouse dev privileges
USE SCHEMA SYNAPSE_DATA_WAREHOUSE_DEV.SYNAPSE_RAW;
GRANT USAGE ON INTEGRATION SYNAPSE_DEV_WAREHOUSE_S3
TO ROLE SYSADMIN;
GRANT USAGE ON INTEGRATION SYNAPSE_DEV_WAREHOUSE_S3
TO ROLE DATA_ENGINEER;


-- GRANT CREATE MASKING POLICY ON SCHEMA synapse_data_warehouse_dev.synapse
-- TO ROLE masking_admin;
GRANT CREATE SCHEMA, USAGE ON DATABASE SYNAPSE_DATA_WAREHOUSE_DEV
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON FUTURE SCHEMAS IN DATABASE SYNAPSE_DATA_WAREHOUSE_DEV
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON FUTURE TABLES IN DATABASE SYNAPSE_DATA_WAREHOUSE_DEV
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON FUTURE STAGES IN DATABASE SYNAPSE_DATA_WAREHOUSE_DEV
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON ALL STAGES IN DATABASE SYNAPSE_DATA_WAREHOUSE_DEV
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON FUTURE STREAMS IN DATABASE SYNAPSE_DATA_WAREHOUSE_DEV
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON ALL STREAMS IN DATABASE SYNAPSE_DATA_WAREHOUSE_DEV
TO ROLE DATA_ENGINEER;


-- Sage database privileges
GRANT ALL PRIVILEGES ON FUTURE SCHEMAS IN DATABASE SAGE
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON FUTURE TABLES IN DATABASE SAGE
TO ROLE DATA_ENGINEER;
GRANT CREATE SCHEMA, USAGE ON DATABASE SAGE
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON ALL SCHEMAS IN DATABASE SAGE
TO ROLE DATA_ENGINEER;
GRANT ALL PRIVILEGES ON ALL TABLES IN DATABASE SAGE
TO ROLE DATA_ENGINEER;

GRANT USAGE ON FUTURE SCHEMAS IN DATABASE SAGE
TO ROLE DATA_ANALYTICS;
GRANT SELECT ON FUTURE TABLES IN DATABASE SAGE
TO ROLE DATA_ANALYTICS;
GRANT SELECT ON FUTURE VIEWS IN DATABASE SAGE
TO ROLE DATA_ANALYTICS;
GRANT USAGE ON DATABASE SAGE
TO ROLE DATA_ANALYTICS;

-- AD database privileges
USE SCHEMA SAGE.AD;
GRANT ALL PRIVILEGES ON SCHEMA AD
TO ROLE AD;
GRANT ALL PRIVILEGES ON FUTURE TABLES IN SCHEMA AD
TO ROLE SYSADMIN;
GRANT CREATE SCHEMA, USAGE ON DATABASE SAGE
TO ROLE AD;

-- GENIE database privileges
USE DATABASE GENIE;
GRANT USAGE ON DATABASE GENIE
TO ROLE GENIE_ADMIN;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE GENIE
TO ROLE GENIE_ADMIN;
GRANT SELECT ON FUTURE TABLES IN DATABASE GENIE
TO ROLE GENIE_ADMIN;

GRANT USAGE ON WAREHOUSE TABLEAU
TO ROLE GENIE_ADMIN;

-- RECOVER database privileges
USE DATABASE RECOVER;
GRANT CREATE SCHEMA, USAGE ON DATABASE RECOVER
TO ROLE RECOVER_DATA_ENGINEER;
GRANT ALL PRIVILEGES ON FUTURE SCHEMAS IN DATABASE RECOVER
TO ROLE RECOVER_DATA_ENGINEER;
GRANT ALL PRIVILEGES ON FUTURE TABLES IN DATABASE RECOVER
TO ROLE RECOVER_DATA_ENGINEER;
GRANT USAGE ON WAREHOUSE RECOVER_XSMALL
TO ROLE RECOVER_DATA_ENGINEER;
GRANT USAGE ON DATABASE RECOVER
TO ROLE RECOVER_DATA_ANALYTICS;
GRANT USAGE ON FUTURE SCHEMAS IN DATABASE RECOVER
TO ROLE RECOVER_DATA_ANALYTICS;
GRANT SELECT ON FUTURE TABLES IN DATABASE RECOVER
TO ROLE RECOVER_DATA_ANALYTICS;
GRANT USAGE ON INTEGRATION RECOVER_DEV_S3
TO ROLE SYSADMIN;

-- Create DBT specific role

GRANT SELECT ON FUTURE TABLES IN DATABASE RECOVER
TO ROLE RECOVER_DATA_ANALYTICS;
