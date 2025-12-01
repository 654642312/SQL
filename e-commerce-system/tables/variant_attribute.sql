CREATE TABLE IF NOT EXISTS variant_attribute (
    id SERIAL PRIMARY KEY,
    variant_id INTEGER NOT NULL REFERENCES product_variant(id) ON DELETE CASCADE,
    
    attribute_name VARCHAR(50) NOT NULL, 
    
    attribute_value VARCHAR(100) NOT NULL,

    UNIQUE (variant_id, attribute_name)
);

