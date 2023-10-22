USE ROLE PUBLIC;
USE DATABASE SYNAPSE_DATA_WAREHOUSE;
USE SCHEMA SYNAPSE;
-- Data up to October 18th for now

-- Total number of downloads in synapse
WITH DEDUP_FILEHANDLE AS (
    SELECT DISTINCT
        USER_ID,
        FILE_HANDLE_ID AS FD_FILE_HANDLE_ID,
        RECORD_DATE
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.FILEDOWNLOAD
)

SELECT count(*)
FROM
    DEDUP_FILEHANDLE;

-- Download count per month in Synapse

WITH DEDUP_FILEHANDLE AS (
    SELECT DISTINCT
        USER_ID,
        FILE_HANDLE_ID AS FD_FILE_HANDLE_ID,
        RECORD_DATE
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.FILEDOWNLOAD
)

SELECT
    date_trunc('MONTH', RECORD_DATE) AS MONTH,
    count(*) AS NUMBER_OF_DOWNLOADS
FROM
    DEDUP_FILEHANDLE
GROUP BY
    MONTH
ORDER BY
    MONTH DESC;
-- * Number of files within each portal in snowflake
USE SCHEMA SAGE.PORTAL_RAW;
SELECT
    TABLE_NAME,
    ROW_COUNT
FROM
    INFORMATION_SCHEMA.TABLES
WHERE
    TABLE_SCHEMA = 'PORTAL_RAW'
ORDER BY
    ROW_COUNT DESC;

-- When do file download records begin?
SELECT DISTINCT RECORD_DATE
FROM
    SYNAPSE_DATA_WAREHOUSE.SYNAPSE_RAW.FILEDOWNLOAD
ORDER BY
    RECORD_DATE ASC;

-- * Metrics for AD portal
USE SCHEMA SAGE.PORTAL_DOWNLOADS;
-- Total download count for AD portal
SELECT count(*)
FROM
    AD_DOWNLOADS;
-- distribution of AD portal downloads per month
SELECT
    date_trunc('MONTH', RECORD_DATE) AS MONTH,
    count(*) AS NUMBER_OF_DOWNLOADS
FROM
    AD_DOWNLOADS
GROUP BY
    MONTH
ORDER BY
    MONTH DESC;

SELECT count(DISTINCT USER_ID)
FROM
    AD_DOWNLOADS;


WITH FILE_SUBSET AS (
    SELECT
        ID,
        CONTENT_SIZE
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.FILE_LATEST
),

AD_TRANSFORM AS (
    SELECT "dataFileHandleId"
    FROM
        SAGE.PORTAL_RAW.AD
)

SELECT
    sum(FILE_SUBSET.CONTENT_SIZE) / power(2, 30) AS TOTAL_SIZE_IN_GB,
    sum(FILE_SUBSET.CONTENT_SIZE) / power(2, 30) * 0.023 * 12 AS PRICE_PER_YEAR
FROM
    AD_TRANSFORM
LEFT JOIN
    FILE_SUBSET
    ON
        AD_TRANSFORM."dataFileHandleId" = FILE_SUBSET.ID;

-- Only get user profiles that aren't linked to sage emails
-- And get download count
WITH USER AS (
    SELECT ID AS PROFILE_ID
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.USERPROFILE_LATEST
    WHERE
        EMAIL NOT LIKE '%@sagebase.org'
)

SELECT count(*)
FROM
    SAGE.PORTAL_DOWNLOADS.AD_DOWNLOADS
WHERE
    USER_ID IN (SELECT PROFILE_ID FROM USER);


-- * GENIE
-- All download counts over time
SELECT count(*)
FROM
    GENIE_DOWNLOADS;

-- Distribution of downloads over months
SELECT
    date_trunc('MONTH', RECORD_DATE) AS MONTH,
    count(*) AS NUMBER_OF_DOWNLOADS
FROM
    GENIE_DOWNLOADS
GROUP BY
    MONTH
ORDER BY
    MONTH DESC;

-- Number of unique users downloading the data
SELECT count(DISTINCT USER_ID)
FROM
    GENIE_DOWNLOADS;

-- storage cost
SELECT
    sum("dataFileSizeBytes") / power(2, 30) AS TOTAL_SIZE_IN_GB,
    sum("dataFileSizeBytes") / power(2, 30) * 0.023 * 12 AS PRICE_PER_YEAR
FROM
    SAGE.PORTAL_RAW.GENIE;

WITH USER AS (
    SELECT ID AS PROFILE_ID
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.USERPROFILE_LATEST
    WHERE
        EMAIL NOT LIKE '%@sagebase.org'
)

SELECT count(*)
FROM
    SAGE.PORTAL_DOWNLOADS.GENIE_DOWNLOADS
WHERE
    USER_ID IN (SELECT PROFILE_ID FROM USER);

-- * ELITE
SELECT count(*)
FROM
    ELITE_DOWNLOADS;
SELECT
    date_trunc('MONTH', RECORD_DATE) AS MONTH,
    count(*) AS NUMBER_OF_DOWNLOADS
FROM
    ELITE_DOWNLOADS
GROUP BY
    MONTH
ORDER BY
    MONTH DESC;

SELECT count(DISTINCT USER_ID)
FROM
    ELITE_DOWNLOADS;

-- upper bound cost estimate, and total amount of files in GB
WITH FILE_SUBSET AS (
    SELECT
        ID,
        CONTENT_SIZE
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.FILE_LATEST
),

NODE_SUBSET AS (
    SELECT
        ID AS NODE_ID,
        FILE_HANDLE_ID
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.NODE_LATEST
),

ELITE_TRANSFORM AS (
    SELECT
        *,
        cast(replace("id", 'syn', '') AS INTEGER) AS SYN_ID
    FROM
        SAGE.PORTAL_RAW.ELITE
)

SELECT
    sum(FILE_SUBSET.CONTENT_SIZE) / power(2, 30) AS TOTAL_SIZE_IN_GB,
    sum(FILE_SUBSET.CONTENT_SIZE) / power(2, 30) * 0.023 * 12 AS PRICE_PER_YEAR
FROM
    ELITE_TRANSFORM
LEFT JOIN
    NODE_SUBSET
    ON
        ELITE_TRANSFORM.SYN_ID = NODE_SUBSET.NODE_ID
LEFT JOIN
    FILE_SUBSET
    ON
        NODE_SUBSET.FILE_HANDLE_ID = FILE_SUBSET.ID;

WITH USER AS (
    SELECT ID AS PROFILE_ID
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.USERPROFILE_LATEST
    WHERE
        EMAIL NOT LIKE '%@sagebase.org'
)

SELECT count(*)
FROM
    SAGE.PORTAL_DOWNLOADS.ELITE_DOWNLOADS
WHERE
    USER_ID IN (SELECT PROFILE_ID FROM USER);
-- * NF
-- Total download
SELECT count(*)
FROM
    NF_DOWNLOADS;
SELECT
    date_trunc('MONTH', RECORD_DATE) AS MONTH,
    count(*) AS NUMBER_OF_DOWNLOADS
FROM
    NF_DOWNLOADS
GROUP BY
    MONTH
ORDER BY
    MONTH DESC;
SELECT count(DISTINCT USER_ID)
FROM
    NF_DOWNLOADS;

SELECT
    sum("dataFileSizeBytes") / power(2, 30) AS TOTAL_SIZE_IN_GB,
    sum("dataFileSizeBytes") / power(2, 30) * 0.023 * 12 AS PRICE_PER_YEAR
FROM
    SAGE.PORTAL_RAW.NF;

WITH USER AS (
    SELECT ID AS PROFILE_ID
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.USERPROFILE_LATEST
    WHERE
        EMAIL NOT LIKE '%@sagebase.org'
)

SELECT count(*)
FROM
    SAGE.PORTAL_DOWNLOADS.NF_DOWNLOADS
WHERE
    USER_ID IN (SELECT PROFILE_ID FROM USER);
-- psychencode
SELECT count(*)
FROM
    PSYCHENCODE_DOWNLOADS;

SELECT
    date_trunc('MONTH', RECORD_DATE) AS MONTH,
    count(*) AS NUMBER_OF_DOWNLOADS
FROM
    PSYCHENCODE_DOWNLOADS
GROUP BY
    MONTH
ORDER BY
    MONTH DESC;
SELECT count(DISTINCT USER_ID)
FROM
    PSYCHENCODE_DOWNLOADS;

WITH FILE_SUBSET AS (
    SELECT
        ID,
        CONTENT_SIZE
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.FILE_LATEST
),

PSYCHENCODE_TRANSFORM AS (
    SELECT "dataFileHandleId"
    FROM
        SAGE.PORTAL_RAW.PSYCHENCODE
)

SELECT
    sum(FILE_SUBSET.CONTENT_SIZE) / power(2, 30) AS TOTAL_SIZE_IN_GB,
    sum(FILE_SUBSET.CONTENT_SIZE) / power(2, 30) * 0.023 * 12 AS PRICE_PER_YEAR
FROM
    PSYCHENCODE_TRANSFORM
LEFT JOIN
    FILE_SUBSET
    ON
        PSYCHENCODE_TRANSFORM."dataFileHandleId" = FILE_SUBSET.ID;

WITH USER AS (
    SELECT ID AS PROFILE_ID
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.USERPROFILE_LATEST
    WHERE
        EMAIL NOT LIKE '%@sagebase.org'
)

SELECT count(*)
FROM
    SAGE.PORTAL_DOWNLOADS.PSYCHENCODE_DOWNLOADS
WHERE
    USER_ID IN (SELECT PROFILE_ID FROM USER);

-- HTAN
SELECT count(*)
FROM
    HTAN_DOWNLOADS;

SELECT
    date_trunc('MONTH', RECORD_DATE) AS MONTH,
    count(*) AS NUMBER_OF_DOWNLOADS
FROM
    HTAN_DOWNLOADS
GROUP BY
    MONTH
ORDER BY
    MONTH DESC;

SELECT count(DISTINCT USER_ID)
FROM
    HTAN_DOWNLOADS;

-- upper bound cost estimate, and total amount of files in GB
WITH FILE_SUBSET AS (
    SELECT
        ID,
        CONTENT_SIZE
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.FILE_LATEST
),

NODE_SUBSET AS (
    SELECT
        ID AS NODE_ID,
        FILE_HANDLE_ID
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.NODE_LATEST
),

HTAN_TRANSFORM AS (
    SELECT
        *,
        cast(replace("entityId", 'syn', '') AS INTEGER) AS SYN_ID
    FROM
        SAGE.PORTAL_RAW.HTAN
)

SELECT
    sum(FILE_SUBSET.CONTENT_SIZE) / power(2, 30) AS TOTAL_SIZE_IN_GB,
    sum(FILE_SUBSET.CONTENT_SIZE) / power(2, 30) * 0.023 * 12 AS PRICE_PER_YEAR
FROM
    HTAN_TRANSFORM
LEFT JOIN
    NODE_SUBSET
    ON
        HTAN_TRANSFORM.SYN_ID = NODE_SUBSET.NODE_ID
LEFT JOIN
    FILE_SUBSET
    ON
        NODE_SUBSET.FILE_HANDLE_ID = FILE_SUBSET.ID;
WITH USER AS (
    SELECT ID AS PROFILE_ID
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.USERPROFILE_LATEST
    WHERE
        EMAIL NOT LIKE '%@sagebase.org'
)

SELECT count(*)
FROM
    SAGE.PORTAL_DOWNLOADS.HTAN_DOWNLOADS
WHERE
    USER_ID IN (SELECT PROFILE_ID FROM USER);
-- All HTAN data
WITH HTAN_PROJECTS AS (
    SELECT
        ID,
        FILE_HANDLE_ID
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.NODE_LATEST
    WHERE
        PROJECT_ID IN (
            20834712,
            23511984,
            22124336,
            22776798,
            23511954,
            23511961,
            22123910,
            23448901,
            22093319,
            23511964,
            21050481,
            22255320,
            24984270,
            22041595,
            25555889
        )
)

SELECT
    sum(FILE_LATEST.CONTENT_SIZE) / power(2, 30) AS TOTAL_SIZE_IN_GB,
    sum(FILE_LATEST.CONTENT_SIZE) / power(2, 40) AS TOTAL_SIZE_IN_TB,
    sum(FILE_LATEST.CONTENT_SIZE) / power(2, 30) * 0.023 * 12 AS PRICE_PER_YEAR
FROM
    HTAN_PROJECTS
LEFT JOIN
    SYNAPSE_DATA_WAREHOUSE.SYNAPSE.FILE_LATEST
    ON
        HTAN_PROJECTS.FILE_HANDLE_ID = FILE_LATEST.ID;
