CREATE SCHEMA IF NOT EXISTS fsweb;



CREATE TABLE fsweb.address (
    id BIGSERIAL PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    no INTEGER,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    description TEXT
);


CREATE TABLE fsweb.customer (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    salary NUMERIC(15,2) NOT NULL,
    address_id BIGINT,
    CONSTRAINT fk_customer_address
        FOREIGN KEY (address_id)
        REFERENCES fsweb.address(id)
        ON DELETE CASCADE
);


CREATE TABLE fsweb.account (
    id BIGSERIAL PRIMARY KEY,
    account_name VARCHAR(100) NOT NULL,
    money_amount NUMERIC(15,2),
    customer_id BIGINT,
    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id)
        REFERENCES fsweb.customer(id)
        ON DELETE SET NULL
);

