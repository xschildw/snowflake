-- This was a small query for https://sagebionetworks.jira.com/browse/SNOW-135
-- The query is to extract email domains and provide a count of unique downloads per email domain
USE ROLE DATA_ANALYTICS;
USE WAREHOUSE COMPUTE_XSMALL;
USE DATABASE SYNAPSE_DATA_WAREHOUSE;


WITH DEDUP_FILEHANDLE AS (
    SELECT DISTINCT
        USER_ID,
        FILE_HANDLE_ID AS FD_FILE_HANDLE_ID,
        RECORD_DATE,
        PROJECT_ID
    FROM
        SYNAPSE_DATA_WAREHOUSE.SYNAPSE.FILEDOWNLOAD
)

SELECT
    REGEXP_SUBSTR(USERS.EMAIL, '[^@]+$') as EMAIL_DOMAIN, 
    count(*) AS NUMBER_OF_DOWNLOADS
FROM
    DEDUP_FILEHANDLE
LEFT JOIN
    SYNAPSE_DATA_WAREHOUSE.SYNAPSE.USERPROFILE_LATEST AS USERS
    ON
    DEDUP_FILEHANDLE.USER_ID = USERS.ID
GROUP BY
    EMAIL_DOMAIN
ORDER BY
    NUMBER_OF_DOWNLOADS DESC;