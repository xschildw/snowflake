use role sysadmin;
CREATE WAREHOUSE IF NOT EXISTS compute_org
    WAREHOUSE_TYPE = STANDARD
    WAREHOUSE_SIZE = XSMALL
    AUTO_SUSPEND = 90
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE;

CREATE WAREHOUSE IF NOT EXISTS compute_medium
    WAREHOUSE_TYPE = STANDARD
    WAREHOUSE_SIZE = MEDIUM
    AUTO_SUSPEND = 70
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE;

CREATE WAREHOUSE IF NOT EXISTS compute_small
    WAREHOUSE_TYPE = STANDARD
    WAREHOUSE_SIZE = XSMALL
    AUTO_SUSPEND = 90
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE;

CREATE WAREHOUSE IF NOT EXISTS recover_xsmall
    WAREHOUSE_TYPE = STANDARD
    WAREHOUSE_SIZE = XSMALL
    AUTO_SUSPEND = 90
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE;

// Increase time on auto suspend for tableau
// TODO: Should create a tableau specific role for tableau
CREATE WAREHOUSE IF NOT EXISTS tableau
    WAREHOUSE_TYPE = STANDARD
    WAREHOUSE_SIZE = XSMALL
    AUTO_SUSPEND = 300
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE;

-- CREATE WAREHOUSE IF NOT EXISTS compute_wh
--     WAREHOUSE_TYPE = STANDARD
--     WAREHOUSE_SIZE = XSMALL
--     AUTO_SUSPEND = 90
--     AUTO_RESUME = TRUE
--     INITIALLY_SUSPENDED = TRUE;
