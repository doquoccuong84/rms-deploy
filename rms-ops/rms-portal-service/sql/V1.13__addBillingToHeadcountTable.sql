ALTER TABLE headcount ADD unit_price DECIMAL;
ALTER TABLE headcount ADD billing_status VARCHAR(20);
ALTER TABLE headcount ADD bandwidth DECIMAL DEFAULT 100 NOT NULL;
ALTER TABLE headcount_resource DROP COLUMN bandwidth;
ALTER TABLE billing ADD updated_at TIMESTAMP NOT NULL;
ALTER TABLE billing ADD created_at TIMESTAMP NOT NULL;
ALTER TABLE billing ADD is_deleted BOOLEAN DEFAULT false;