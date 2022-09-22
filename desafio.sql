CREATE DATABASE unidad02;

psql -U postgres -d unidad02 -f unidad2.sql 

psql -U postgres -d unidad02

BEGIN;
INSERT INTO compra (id, cliente_id, fecha) VALUES(33, 1, now());

INSERT INTO detalle_compre(id, producto_id, compra_id, cantidad) VALUE(43, 9, 33, 5);
UPDATE producto SET stock = stock - 5 WHERE id = 9;
SELECT stock FROM producto WHERE id = 9;
COMMIT;

SAVE;
INSERT INTO compra (id, cliente_id, fecha) VALUE(33, 1, now());

INSERT INTO detalle_compra(id, producto_id, compr_id), cantidad VALUE (43, 9, 33, 5);
UPDATE producto SET stock = stock -3 WHERE id = 1;
UPDATE producto SET stock = stock -3 WHERE id = 2;
UPDATE producto  stock = stock -3 WHERE id = 8;
