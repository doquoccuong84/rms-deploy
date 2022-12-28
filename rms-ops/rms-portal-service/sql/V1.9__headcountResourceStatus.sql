ALTER TABLE headcount_resource ADD COLUMN status VARCHAR(50) DEFAULT 'Scheduled' NOT NULL;
ALTER TABLE headcount_resource DROP COLUMN title;