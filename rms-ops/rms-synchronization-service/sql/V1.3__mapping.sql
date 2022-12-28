CREATE TABLE
    IF NOT EXISTS hrm(
        id BIGSERIAL PRIMARY KEY,
        name VARCHAR UNIQUE,
        is_deleted BOOLEAN DEFAULT false,
        created_at TIMESTAMP NOT NULL,
        updated_at TIMESTAMP NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS mapping(
        hrm_id BIGSERIAL,
        hrm_field VARCHAR NOT NULL,
        native_field VARCHAR NOT NULL,
        is_dynamic BOOLEAN DEFAULT false,
        PRIMARY KEY(hrm_id, native_field),
        CONSTRAINT fk_hrm_mapping FOREIGN KEY(hrm_id) REFERENCES hrm(id)
    );