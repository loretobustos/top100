-- sudo -i -u postgres
-- clave para OEM 212121
-- psql (entrar a postgres como root)
-- \l (ver mis bases de datos)
-- 
-- 1. Crear base de datos llamada blog. (1 Punto)

CREATE DATABASE blog;
-- psql -U postgres -d blog
-- \c blog
-- 
-- 2. Crear las tablas indicadas de acuerdo al modelo de datos. (2 Puntos)

CREATE TABLE usuario(id SERIAL PRIMARY KEY,email VARCHAR(255));
-- \dt
          List of relations
 Schema |  Name   | Type  |  Owner   
--------+---------+-------+----------
 public | post    | table | postgres
(1 rows)

CREATE TABLE post(    id SERIAL PRIMARY KEY,    titulo VARCHAR(50),    fecha DATE,    usuario_id INT REFERENCES usuario(id));
-- \dt
          List of relations
 Schema |  Name   | Type  |  Owner   
--------+---------+-------+----------
 public | post    | table | postgres
 public | usuario | table | postgres
(2 rows)

CREATE TABLE comentario(id SERIAL PRIMARY KEY,texto VARCHAR(50),fecha DATE,post_id INT REFERENCES post(id),usuario_id INT REFERENCES usuario(id));
-- \dt
           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | comentario | table | postgres
 public | post       | table | postgres
 public | usuario    | table | postgres
(3 rows)

-- 3. Insertar los siguientes registros. (1 Punto)
-- CON METODO INSERT Y COPY DESDE ARCHIVO CSV
INSERT INTO usuario (email) VALUES('usuario01@hotmail.com'),('usuario02@gmail.com'),('usuario03@gmail.com'),('usuario04@hotmail.com'),('usuario05@yahoo.com'),('usuario06@hotmail.com'),('usuario07@yahoo.com'),('usuario08@yahoo.com'),('usuario09@yahoo.com');
\copy post(usuario_id, titulo, fecha) FROM '/media/oem/Windows/bootcamp/mod 5/tema 2 POSTGRES RELACIONES/post.csv' CSV HEADER;
 id |         email         
----+-----------------------
  1 | usuario01@hotmail.com
  2 | usuario02@gmail.com
  3 | usuario03@gmail.com
  4 | usuario04@hotmail.com
  5 | usuario05@yahoo.com
  6 | usuario06@hotmail.com
  7 | usuario07@yahoo.com
  8 | usuario08@yahoo.com
  9 | usuario09@yahoo.com
(9 rows)

INSERT INTO post(usuario_id, titulo, fecha) VALUES(1,'Post 1: Esto es malo','2020-06-29'),(5,'Post 2: Esto es malo','2020-06-20'),(1,'Post 3: Esto es excelente','2020-05-30'),(9,'Post 4: Esto es bueno','2020-05-09'),(7,'Post 5: Esto es bueno','2020-07-10'),(5,'Post 6: Esto es excelente','2020-07-18'),(8,'Post 7: Esto es excelente','2020-07-07'),(5,'Post 8: Esto es excelente','2020-05-14'),(2,'Post 9: Esto es bueno','2020-05-08'),(6,'Post 10: Esto es bueno','2020-06-02'),(4,'Post 11: Esto es bueno','2020-05-05'),(9,'Post 12: Esto es malo','2020-07-23'),(5,'Post 13: Esto es excelente','2020-05-30'),(8,'Post 14: Esto es excelente','2020-05-01'),(7,'Post 15: Esto es malo','2020-06-17');
\copy post(usuario_id, titulo, fecha) FROM '/media/oem/Windows/bootcamp/mod 5/tema 2 POSTGRES RELACIONES/post.csv' CSV HEADER;
 id |           titulo           |   fecha    | usuario_id 
----+----------------------------+------------+------------
  1 | Post 1: Esto es malo       | 2020-06-29 |          1
  2 | Post 2: Esto es malo       | 2020-06-20 |          5
  3 | Post 3: Esto es excelente  | 2020-05-30 |          1
  4 | Post 4: Esto es bueno      | 2020-05-09 |          9
  5 | Post 5: Esto es bueno      | 2020-07-10 |          7
  6 | Post 6: Esto es excelente  | 2020-07-18 |          5
  7 | Post 7: Esto es excelente  | 2020-07-07 |          8
  8 | Post 8: Esto es excelente  | 2020-05-14 |          5
  9 | Post 9: Esto es bueno      | 2020-05-08 |          2
 10 | Post 10: Esto es bueno     | 2020-06-02 |          6
 11 | Post 11: Esto es bueno     | 2020-05-05 |          4
 12 | Post 12: Esto es malo      | 2020-07-23 |          9
 13 | Post 13: Esto es excelente | 2020-05-30 |          5
 14 | Post 14: Esto es excelente | 2020-05-01 |          8
 15 | Post 15: Esto es malo      | 2020-06-17 |          7
(15 rows)

INSERT INTO comentario(post_id,usuario_id,texto,fecha) VALUES(6,3,'Este es el comentario 1','2020-07-08'),(2,4,'Este es el comentario 2','2020-06-07'),(4,6,'Este es el comentario 3','2020-06-16'),(13,2,'Este es el comentario 4','2020-06-15'),(6,6,'Este es el comentario 5','2020-05-14'),(3,3,'Este es el comentario 6','2020-07-08'),(1,6,'Este es el comentario 7','2020-05-22'),(7,6,'Este es el comentario 8','2020-07-09'),(13,8,'Este es el comentario 9','2020-06-30'),(6,8,'Este es el comentario 10','2020-06-19'),(1,5,'Este es el comentario 11','2020-05-09'),(15,8,'Este es el comentario 12','2020-06-17'),(9,1,'Este es el comentario 13','2020-05-01'),(5,2,'Este es el comentario 14','2020-05-31'),(3,4,'Este es el comentario 15','2020-06-28');
\copy comentario(post_id,usuario_id,texto,fecha) FROM '/media/oem/Windows/bootcamp/mod 5/tema 2 POSTGRES RELACIONES/comentarios.csv' CSV HEADER;
 id |          texto           |   fecha    | post_id | usuario_id 
----+--------------------------+------------+---------+------------
  1 | Este es el comentario 1  | 2020-07-08 |       6 |          3
  2 | Este es el comentario 2  | 2020-06-07 |       2 |          4
  3 | Este es el comentario 3  | 2020-06-16 |       4 |          6
  4 | Este es el comentario 4  | 2020-06-15 |      13 |          2
  5 | Este es el comentario 5  | 2020-05-14 |       6 |          6
  6 | Este es el comentario 6  | 2020-07-08 |       3 |          3
  7 | Este es el comentario 7  | 2020-05-22 |       1 |          6
  8 | Este es el comentario 8  | 2020-07-09 |       7 |          6
  9 | Este es el comentario 9  | 2020-06-30 |      13 |          8
 10 | Este es el comentario 10 | 2020-06-19 |       6 |          8
 11 | Este es el comentario 11 | 2020-05-09 |       1 |          5
 12 | Este es el comentario 12 | 2020-06-17 |      15 |          8
 13 | Este es el comentario 13 | 2020-05-01 |       9 |          1
 14 | Este es el comentario 14 | 2020-05-31 |       5 |          2
 15 | Este es el comentario 15 | 2020-06-28 |       3 |          4
(15 rows)

-- DROP SECUENCE nombre_secuencia

-- 4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5(1 Punto)


SELECT usuario.email, post.titulo, usuario_id
FROM usuario
RIGHT JOIN post ON usuario.id=post.usuario_id
WHERE usuario_id = 5;

        email        |           titulo           | usuario_id 
---------------------+----------------------------+------------
 usuario05@yahoo.com | Post 2: Esto es malo       |          5
 usuario05@yahoo.com | Post 6: Esto es excelente  |          5
 usuario05@yahoo.com | Post 8: Esto es excelente  |          5
 usuario05@yahoo.com | Post 13: Esto es excelente |          5
(4 rows)


-- 5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el usuario con email usuario06@hotmail.com. (1 Punto)

SELECT comentario.usuario_id, usuario.email, comentario.texto FROM usuario  inner JOIN comentario  ON usuario.id=comentario.usuario_id WHERE usuario.email='usuario06@hotmail.com' IS false ORDER BY usuario.email ;

usuario_id |         email         |          texto           
------------+-----------------------+--------------------------
          1 | usuario01@hotmail.com | Este es el comentario 13
          2 | usuario02@gmail.com   | Este es el comentario 14
          2 | usuario02@gmail.com   | Este es el comentario 4
          3 | usuario03@gmail.com   | Este es el comentario 6
          3 | usuario03@gmail.com   | Este es el comentario 1
          4 | usuario04@hotmail.com | Este es el comentario 15
          4 | usuario04@hotmail.com | Este es el comentario 2
          5 | usuario05@yahoo.com   | Este es el comentario 11
          8 | usuario08@yahoo.com   | Este es el comentario 12
          8 | usuario08@yahoo.com   | Este es el comentario 10
          8 | usuario08@yahoo.com   | Este es el comentario 9
(11 rows)


-- 6. Listar los usuarios que no han publicado ningún post. (1 Punto)

SELECT usuario.* FROM usuario FULL OUTER JOIN post ON post.usuario_id=usuario.id WHERE post.usuario_id IS NULL OR usuario.id  IS NULL ORDER BY post.usuario_id ASC;
 id |        email        
----+---------------------
  3 | usuario03@gmail.com
(1 row)

-- 7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios). (1 Punto)

SELECT * FROM post FULL OUTER JOIN comentario ON post.id=comentario.post_id order by post.id;
 id |           titulo           |   fecha    | usuario_id | id |          texto           |   fecha    | post_id | usuario_id 
----+----------------------------+------------+------------+----+--------------------------+------------+---------+------------
  1 | Post 1: Esto es malo       | 2020-06-29 |          1 | 11 | Este es el comentario 11 | 2020-05-09 |       1 |          5
  1 | Post 1: Esto es malo       | 2020-06-29 |          1 |  7 | Este es el comentario 7  | 2020-05-22 |       1 |          6
  2 | Post 2: Esto es malo       | 2020-06-20 |          5 |  2 | Este es el comentario 2  | 2020-06-07 |       2 |          4
  3 | Post 3: Esto es excelente  | 2020-05-30 |          1 | 15 | Este es el comentario 15 | 2020-06-28 |       3 |          4
  3 | Post 3: Esto es excelente  | 2020-05-30 |          1 |  6 | Este es el comentario 6  | 2020-07-08 |       3 |          3
  4 | Post 4: Esto es bueno      | 2020-05-09 |          9 |  3 | Este es el comentario 3  | 2020-06-16 |       4 |          6
  5 | Post 5: Esto es bueno      | 2020-07-10 |          7 | 14 | Este es el comentario 14 | 2020-05-31 |       5 |          2
  6 | Post 6: Esto es excelente  | 2020-07-18 |          5 |  1 | Este es el comentario 1  | 2020-07-08 |       6 |          3
  6 | Post 6: Esto es excelente  | 2020-07-18 |          5 |  5 | Este es el comentario 5  | 2020-05-14 |       6 |          6
  6 | Post 6: Esto es excelente  | 2020-07-18 |          5 | 10 | Este es el comentario 10 | 2020-06-19 |       6 |          8
  7 | Post 7: Esto es excelente  | 2020-07-07 |          8 |  8 | Este es el comentario 8  | 2020-07-09 |       7 |          6
  8 | Post 8: Esto es excelente  | 2020-05-14 |          5 |    |                          |            |         |           
  9 | Post 9: Esto es bueno      | 2020-05-08 |          2 | 13 | Este es el comentario 13 | 2020-05-01 |       9 |          1
 10 | Post 10: Esto es bueno     | 2020-06-02 |          6 |    |                          |            |         |           
 11 | Post 11: Esto es bueno     | 2020-05-05 |          4 |    |                          |            |         |           
 12 | Post 12: Esto es malo      | 2020-07-23 |          9 |    |                          |            |         |           
 13 | Post 13: Esto es excelente | 2020-05-30 |          5 |  9 | Este es el comentario 9  | 2020-06-30 |      13 |          8
 13 | Post 13: Esto es excelente | 2020-05-30 |          5 |  4 | Este es el comentario 4  | 2020-06-15 |      13 |          2
 14 | Post 14: Esto es excelente | 2020-05-01 |          8 |    |                          |            |         |           
 15 | Post 15: Esto es malo      | 2020-06-17 |          7 | 12 | Este es el comentario 12 | 2020-06-17 |      15 |          8
(20 rows)

-- 8. Listar todos los usuarios que hayan publicado un post en Junio. (2 Puntos)

-- depende del formato
SHOW datestyle;
SET datestyle = "ISO,YMD";
SHOW datestyle;

SELECT usuario.email AS usuarios_que_han_publicado_en_junio FROM usuario, post WHERE usuario.id=post.usuario_id AND post.fecha BETWEEN '2020-06-01 00:00:00' AND '2020-06-30 23:59:59';
 usuarios_que_han_publicado_en_junio 
-------------------------------------
 usuario01@hotmail.com
 usuario05@yahoo.com
 usuario06@hotmail.com
 usuario07@yahoo.com
(4 rows)
