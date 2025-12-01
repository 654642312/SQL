CREATE TABLE IF NOT EXISTS product_variant_discount (
    id SERIAL PRIMARY KEY,
    variant_id INTEGER NOT NULL REFERENCES product_variant(variant_id) ON DELETE CASCADE,
    discount_id INTEGER NOT NULL REFERENCES discount(id) ON DELETE CASCADE,
    
    assigned_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,

    -- We ensure that the SAME discount is not applied twice to the same variant
    UNIQUE (variant_id, discount_id)
);