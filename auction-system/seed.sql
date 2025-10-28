INSERT INTO users (id, first_name, last_name, email) VALUES
(1, 'Juan', 'Perez', 'juan.perez@email.com'),
(2, 'Maria', 'Gomez', 'maria.gomez@email.com'),
(3, 'Carlos', 'Ramirez', 'carlos.ramirez@email.com'),
(4, 'Ana', 'Lopez', 'ana.lopez@email.com'),
(5, 'David', 'Sanchez', 'david.sanchez@email.com'),
(6, 'Sofia', 'Mendez', 'sofia.mendez@email.com'),
(7, 'Luis', 'Torres', 'luis.torres@email.com'),
(8, 'Elena', 'Vargas', 'elena.vargas@email.com');

INSERT INTO balance (user_id, amount) VALUES
(1, 500.00),    
(2, 1200.50),   
(3, 75.25),     
(4, 3000.00),   
(5, 100.00),    
(6, 450.99),    
(7, 980.15),   
(8, 2500.75);

INSERT INTO product (id, title, description, starting_price) VALUES
(1, 'Laptop Ultrabook X', 'Potente y ligera laptop con procesador de última generación.', 1250.00),
(2, 'Smartphone Alpha Pro', 'Teléfono móvil con triple cámara, pantalla OLED y batería de larga duración.', 899.99),
(3, 'Auriculares Inalámbricos Z', 'Sonido de alta fidelidad con cancelación activa de ruido.', 149.50),
(4, 'Mouse Ergonómico Gaming', 'Diseño cómodo con alta precisión para largas sesiones de juego.', 45.99),
(5, 'Teclado Mecánico RGB', 'Teclado con interruptores táctiles y retroiluminación personalizable.', 95.00),
(6, 'Monitor Curvo 32"', 'Pantalla de alta resolución y 144Hz, ideal para trabajo y entretenimiento.', 450.75),
(7, 'Impresora Multifuncional A3', 'Impresora con escáner y copiadora, soporta impresión en formato A3.', 280.00),
(8, 'Cámara Mirrorless 4K', 'Cámara compacta con grabación de video 4K y lentes intercambiables.', 1500.00),
(9, 'Batería Externa 20000mAh', 'Power bank de alta capacidad para cargar múltiples dispositivos.', 35.50),
(10, 'Router Wi-Fi 6', 'Router de doble banda para una conexión rápida y estable en todo el hogar.', 79.99);


INSERT INTO offer (product_id, user_id, amount) VALUES
(1, 1, 1280.00),
(1, 2, 1350.00),
(1, 3, 1400.00),
(2, 4, 910.00),
(2, 5, 950.00),
(3, 6, 155.00),
(4, 7, 48.00),
(5, 8, 100.00),
(6, 1, 500.00),
(7, 2, 350.00);