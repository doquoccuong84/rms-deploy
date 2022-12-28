CREATE TABLE
    IF NOT EXISTS resourcestats (
        headcount_id INT NOT NULL,
        resource_id INT NOT NULL,
        status VARCHAR(20) NOT NULL,
        update_date DATE NOT NULL,
        PRIMARY KEY (headcount_id, update_date)
    );

ALTER TABLE projectstats DROP COLUMN resource_count 