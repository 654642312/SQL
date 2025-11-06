CREATE TYPE enum_invoice AS ENUM ('AUCTION_SALE', 'DEPOSIT_RATE'); 

CREATE TABLE invoice(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    amount NUMERIC(10,2) NOT NULL,
    comission_rate NUMERIC(5,4) NOT NUL,
    type enum_invoice NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);