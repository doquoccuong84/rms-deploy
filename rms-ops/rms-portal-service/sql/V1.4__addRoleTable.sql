
ALTER TABLE Resources
DROP CONSTRAINT IF EXISTS fk_ResourceRoles;
DROP TABLE IF EXISTS ResourceRoles;
ALTER TABLE Resources DROP CONSTRAINT IF EXISTS resources_email_key;
ALTER TABLE Resources DROP CONSTRAINT IF EXISTS resources_phone_number_key;
ALTER TABLE Resources ALTER column email DROP NOT NULL;
CREATE TABLE
    IF NOT EXISTS Roles (
                            id BIGSERIAL PRIMARY KEY,
                            title VARCHAR(50) NOT NULL,
    is_deleted BOOLEAN DEFAULT false,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Resources_Roles (
                                     resources_id INT NOT NULL,
                                     roles_id INT NOT NULL,
                                     is_deleted BOOLEAN DEFAULT false,
                                     created_at DATE NOT NULL,
                                     updated_at DATE NOT NULL,
                                     CONSTRAINT fk_resources FOREIGN KEY(resources_id) REFERENCES Resources(id),
    CONSTRAINT fk_roles FOREIGN KEY(roles_id ) REFERENCES Roles(id),
    CONSTRAINT resources_roles_pkey PRIMARY KEY (resources_id , roles_id )
    );

