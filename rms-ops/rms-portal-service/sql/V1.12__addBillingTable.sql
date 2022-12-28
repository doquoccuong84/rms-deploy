CREATE TABLE
    IF NOT EXISTS Billing (
        headcount_resource_id INT,
        time_spent INT,
        time_off INT,
        billing_status VARCHAR(20) ,
        billing_month DATE,
        unit_price DECIMAL,
        amount DECIMAL ,
        PRIMARY KEY (
            headcount_resource_id,
            billing_month
        ),
        CONSTRAINT fk_headcount_resource FOREIGN KEY(headcount_resource_id) REFERENCES headcount_resource(id)
    );