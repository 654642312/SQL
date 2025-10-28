CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL CHECK (TRIM(title) <> ''),
    description VARCHAR(255) NOT NULL,
    starting_price DECIMAL(10, 2) NOT NULL CHECK (starting_price > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);