CREATE TYPE discount_type_enum AS ENUM ('PERCENTAGE', 'FIXED_AMOUNT');

CREATE TABLE IF NOT EXISTS discount (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    
    -- discount type: 'PERCENTAGE' (20%) or 'FIXED_AMOUNT' ($10.00 off)
    discount_type discount_type_enum NOT NULL,
    discount_value DECIMAL(10, 2) NOT NULL, -- The value (20 or 10.00)
    
    -- Validity dates (Critical for temporary discounts)
    start_at TIMESTAMPTZ NOT NULL,
    end_at TIMESTAMPTZ NOT NULL,
    
    is_active BOOLEAN DEFAULT TRUE, -- To manually deactivate before time if necessary
    
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    
    -- Validation to ensure the end date is not before the start date
    CHECK (end_at > start_at)
);