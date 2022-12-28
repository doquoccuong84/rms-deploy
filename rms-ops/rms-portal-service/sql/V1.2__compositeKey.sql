ALTER TABLE Resources_HardSkills DROP CONSTRAINT IF EXISTS resources_hardskills_pkey CASCADE;
DROP SEQUENCE IF EXISTS resources_hardskills_id_seq CASCADE;
ALTER TABLE Resources_HardSkills ADD CONSTRAINT resources_hardskills_pkey PRIMARY KEY (resources_id, hard_skills_id);
ALTER TABLE Resources_HardSkills DROP COLUMN id CASCADE;

ALTER TABLE Timesheets_Resources_Projects DROP CONSTRAINT IF EXISTS timesheets_resources_projects_pkey CASCADE;
DROP SEQUENCE IF EXISTS timesheets_resources_projects_id_seq CASCADE;
ALTER TABLE Timesheets_Resources_Projects ADD CONSTRAINT timesheets_resources_projects_pkey PRIMARY KEY (resources_projects_id, timesheets_id);
ALTER TABLE Timesheets_Resources_Projects DROP COLUMN id CASCADE;