CREATE TABLE
    IF NOT EXISTS projectstats (
        project_id INT NOT NULL,
        status VARCHAR(20) NOT NULL,
        resource_count INT NOT NULL,
        update_date DATE NOT NULL,

        PRIMARY KEY (project_id, update_date)
    );

    