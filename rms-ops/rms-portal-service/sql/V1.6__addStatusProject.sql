ALTER TABLE resources DROP COLUMN resource_roles_id;

ALTER TABLE resources_hardskills ADD skill_exp DECIMAL;

ALTER TABLE resources_hardskills ALTER skill_exp SET DEFAULT 0;

ALTER TABLE projects ADD status VARCHAR(50) NOT NULL;