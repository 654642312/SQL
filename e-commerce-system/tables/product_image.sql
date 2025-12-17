CREATE TABLE IF NOT EXISTS product_images (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES product(id) ON DELETE CASCADE,
    variant_id INTEGER REFERENCES product_variant(id) ON DELETE CASCADE,
    
    image_url VARCHAR(500) NOT NULL,
    sort_order INTEGER DEFAULT 0,  
    is_main BOOLEAN DEFAULT FALSE,

    CHECK (
        (product_id IS NOT NULL AND variant_id IS NULL) OR 
        (variant_id IS NOT NULL AND product_id IS NULL)
    )
);