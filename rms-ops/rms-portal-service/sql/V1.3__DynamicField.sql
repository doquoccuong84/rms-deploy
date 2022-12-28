ALTER TABLE Resources ALTER COLUMN resource_roles_id DROP NOT NULL;
ALTER TABLE Resources ALTER COLUMN departments_id DROP NOT NULL;
ALTER TABLE Resources ALTER COLUMN years_of_experience DROP NOT NULL;
CREATE SEQUENCE resources_code_seq;
ALTER TABLE Resources ALTER COLUMN code TYPE INT USING (code::integer);
ALTER TABLE Resources ALTER COLUMN code SET DEFAULT nextval('resources_code_seq');
ALTER SEQUENCE resources_code_seq OWNED BY Resources.code;
ALTER TABLE Resources ALTER COLUMN code SET NOT NULL;
ALTER TABLE Resources ADD CONSTRAINT resources_code_unique UNIQUE (code);

ALTER TABLE Resources ADD COLUMN display_name varchar(50) NOT NULL;
ALTER TABLE Resources ADD COLUMN email VARCHAR(50) NOT NUll UNIQUE;
ALTER TABLE Resources ADD COLUMN phone_number VARCHAR(20) UNIQUE;
ALTER TABLE Resources ADD COLUMN avatar varchar(50) NOT NULL;

ALTER TABLE Resources DROP COLUMN remain_bandwidth;

CREATE TABLE
    IF NOT EXISTS Attributes(
                                id BIGSERIAL PRIMARY KEY,
                                name VARCHAR(50) NOT NULL,
    code VARCHAR(50) NOT NULL,
    format VARCHAR(50) NOT NULL,
    regex VARCHAR(50)  NOT NULL,
    is_deleted BOOLEAN DEFAULT false,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Sections(
                              id BIGSERIAL PRIMARY KEY,
                              name VARCHAR(50) NOT NULL,
    is_deleted BOOLEAN DEFAULT false,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Templates(
                               id BIGSERIAL PRIMARY KEY,
                               name VARCHAR(50) NOT NULL,
    is_deleted BOOLEAN DEFAULT false,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Values (
                             id BIGSERIAL PRIMARY KEY,
                             resources_id INT NOT NULL,
                             attributes_id INT NOT NULL,
                             code VARCHAR(50) NOT NULL,
    value VARCHAR(50) NOT NULL,
    is_deleted BOOLEAN DEFAULT false,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    CONSTRAINT fk_Resources FOREIGN KEY(resources_id) REFERENCES Resources(id),
    CONSTRAINT fk_Attributes FOREIGN KEY(attributes_id) REFERENCES Attributes(id)
    );

CREATE TABLE
    IF NOT EXISTS AvailableValues(
                                     id BIGSERIAL PRIMARY KEY,
                                     attributes_id INT NOT NULL,
                                     value VARCHAR(50) NOT NULL,
    is_deleted BOOLEAN DEFAULT false,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    CONSTRAINT fk_Attributes FOREIGN KEY(attributes_id) REFERENCES Attributes(id)
    );

CREATE TABLE
    IF NOT EXISTS Sections_Attributes(
                                         sections_id INT NOT NULL,
                                         attributes_id INT NOT NULL,
                                         is_deleted BOOLEAN DEFAULT false,
                                         created_at DATE NOT NULL,
                                         updated_at DATE NOT NULL,
                                         CONSTRAINT fk_Sections FOREIGN KEY(sections_id ) REFERENCES Sections(id),
    CONSTRAINT fk_Attributes FOREIGN KEY(attributes_id) REFERENCES Attributes(id),
    CONSTRAINT sections_attributes_pkey PRIMARY KEY (sections_id, attributes_id)
    );

CREATE TABLE
    IF NOT EXISTS Templates_Sections(
                                        templates_id INT NOT NULL,
                                        sections_id INT NOT NULL,
                                        is_deleted BOOLEAN DEFAULT false,
                                        created_at DATE NOT NULL,
                                        updated_at DATE NOT NULL,
                                        CONSTRAINT fk_Sections FOREIGN KEY(sections_id ) REFERENCES Sections(id),
    CONSTRAINT fk_Templates FOREIGN KEY(templates_id) REFERENCES Templates(id),
    CONSTRAINT templates_sections_pkey PRIMARY KEY (sections_id, templates_id)
    );


