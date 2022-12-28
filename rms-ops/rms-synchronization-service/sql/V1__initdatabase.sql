CREATE TABLE
    IF NOT EXISTS Roles(
        id BIGSERIAL PRIMARY KEY,
        owner VARCHAR(50) NOT NULL,
        display_name VARCHAR(50) NOT NULL,
        name VARCHAR(50) NOT NULL,
        is_enabled BOOLEAN DEFAULT true,
        is_deleted BOOLEAN DEFAULT false,
        created_at DATE NOT NULL,
        updated_at DATE NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Resources(
        id BIGSERIAL PRIMARY KEY,
        uuid VARCHAR NOT NULL UNIQUE,
        owner VARCHAR(50) NOT NULL,
        display_name VARCHAR(50) NOT NULL,
        name VARCHAR(50) NOT NULL,
        avatar VARCHAR NOT NULL,
        email VARCHAR(50) NOT NULL,
        phone_number VARCHAR(50) NOT NULL,
        is_deleted BOOLEAN DEFAULT false,
        created_at DATE NOT NULL,
        updated_at DATE NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Resources_Roles(
        roles_id INT NOT NULL,
        resources_id INT NOT NULL,
        is_deleted BOOLEAN DEFAULT false,
        created_at DATE NOT NULL,
        updated_at DATE NOT NULL,
        CONSTRAINT fk_Roles FOREIGN KEY(roles_id) REFERENCES Roles(id),
        CONSTRAINT fk_Resources FOREIGN KEY(resources_id) REFERENCES Resources(id),
        CONSTRAINT resources_roles_pkey PRIMARY KEY (roles_id, resources_id)
    );