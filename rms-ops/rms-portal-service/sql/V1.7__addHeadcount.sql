CREATE TABLE
    IF NOT EXISTS headcount (
        id BIGSERIAL PRIMARY KEY,
        code_id VARCHAR(20) NOT NULL,
        role_id INT NOT NULL,
        exp_require INT NOT NULL,
        project_id INT NOT NULL,
        is_deleted BOOLEAN DEFAULT false,
        created_at DATE NOT NULL,
        updated_at DATE NOT NULL,
        CONSTRAINT fk_Project FOREIGN KEY(project_id) REFERENCES projects(id),
        CONSTRAINT fk_Role FOREIGN KEY(role_id) REFERENCES roles(id)
    );

CREATE TABLE
    IF NOT EXISTS headcount_hardskill (
        headcount_id INT NOT NULL,
        hardskill_id INT NOT NULL,
        is_deleted BOOLEAN DEFAULT false,
        created_at DATE NOT NULL,
        updated_at DATE NOT NULL,
        CONSTRAINT fk_hardSkill FOREIGN KEY(hardskill_id) REFERENCES hardskills(id),
        CONSTRAINT fk_headcount FOREIGN KEY(headcount_id) REFERENCES headcount(id),
        CONSTRAINT headcount_hardskill_pkey PRIMARY KEY (headcount_id, hardskill_id)
    );

ALTER table resources_projects DROP CONSTRAINT fk_projects;

ALTER table resources_projects ADD COLUMN headcount_id INT;

ALTER TABLE resources_projects
ADD
    CONSTRAINT fk_headecount FOREIGN KEY (headcount_id) REFERENCES headcount(id);

ALTER table resources_projects DROP COLUMN projects_id;

ALTER TABLE resources_projects RENAME TO headcount_resource;