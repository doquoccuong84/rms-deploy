CREATE TABLE
    IF NOT EXISTS resources (
        uuid VARCHAR PRIMARY KEY,
        username VARCHAR(50) NOT NULL,
        display_name VARCHAR(50),
        email VARCHAR(50) UNIQUE,
        phone_number VARCHAR(50),
        avatar VARCHAR(50),
        years_of_experience DECIMAL DEFAULT 0,
        is_deleted BOOLEAN DEFAULT false,
        created_at TIMESTAMP NOT NULL,
        updated_at TIMESTAMP NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS attributes(
        id BIGSERIAL PRIMARY KEY,
        name VARCHAR(50) UNIQUE,
        code VARCHAR(50),
        format VARCHAR(50),
        regex VARCHAR(50),
        is_deleted BOOLEAN DEFAULT false,
        created_at TIMESTAMP NOT NULL,
        updated_at TIMESTAMP NOT NULL
    );

CREATE TABLE IF NOT EXISTS
Values (
        resources_uuid VARCHAR,
        attributes_id INT,
        value VARCHAR,
        code VARCHAR(50),
        is_deleted BOOLEAN DEFAULT false,
        created_at TIMESTAMP NOT NULL,
        updated_at TIMESTAMP NOT NULL,
        PRIMARY KEY (resources_uuid, attributes_id),
        CONSTRAINT fk_resources FOREIGN KEY(resources_uuid) REFERENCES resources(uuid),
        CONSTRAINT fk_attributes FOREIGN KEY(attributes_id) REFERENCES attributes(id)
    );