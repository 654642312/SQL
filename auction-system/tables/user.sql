CREATE TABLE users (
    id SERIAL PRIMARY KEY
    first_name VARCHAR(50) NOT NULL CHECK (TRIM(first_name) <> '')
    last_name VARCHAR(50) NOT NULL  CHECK (TRIM(last_name) <> '')
    email VARCHAR(255) UNIQUE NOT NULL CHECK (TRIM(email) <> '')
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);