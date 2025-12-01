SELECT
    p.product_id,
    p.name,
    p.slug,
    MIN(v.price) AS starting_price,
    (
        SELECT pi.image_url 
        FROM product_image pi 
        WHERE pi.product_id = p.product_id AND pi.is_main = TRUE AND pi.variant_id IS NULL 
        ORDER BY pi.sort_order 
        LIMIT 1
    ) AS main_image_url
FROM
    product p
JOIN
    product_variant v ON p.product_id = v.product_id
WHERE
    v.stock > 0
GROUP BY
    p.product_id, p.name, p.slug
ORDER BY
    p.name
LIMIT 50;