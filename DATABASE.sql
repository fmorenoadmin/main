/**********************************************************************
-----------------------------------------------------------------------
Se debe crear la base de datos antes de ejecutar las siguientes limeas.
-----------------------------------------------------------------------
Frank M. moreno A. - Versión 1.0 / Programming World - DataBase
-----------------------------------------------------------------------
-----------------------------------------------------------------------
Readme:
-----------------------------------------------------------------------
-----------------------------------------------------------------------
A los Programadore BackEnd del Grupo:
-----
Ante todo, Saludos y muchas bendiciones
-----
En la presente se creará la Base de datos del sistema. Favor de no
eliminar ninguna de las líneas en este documento.
Ya que cada linea es vital para el funcionamiento y la estructura de la
Base de Datos del Sistema.
-----
También se les hace recordar a los programadores que para que sea mas
factible el acceso a este archivo y a la estructura de la Base de Datos
tratemos de generar en este script, todas las tablas, procedimientos, 
triggers, funciones, inserts, etc.
----- 
Que nuestra Base de Datos usará para el Sistema E-commerce utilizará a
lo largo d esu creación.
-----
Para de esta manerá tener toso en un solo lugar y pueda ser accesible
por cada uno de los participantes del Proyecto.
-----
Muy Atentamte,
-----
Frank M. Moreno Alburqueque.
Programador Web - Webmaster
admin@frankmorenoalburqueque.com
https://www.frankmorenoalburqueque.com
----------------------------------------------------------------------
*********************************************************************/

/*
-------------------------
Creación de la Base datos
-------------------------
*/

CREATE TABLE tipo_usuario 
(
	id_tipo char(8) PRIMARY KEY not null,
	nombre_tipo varchar(120) not null,
	description_tipo varchar(700) null,
	UNIQUE id_tipo (id_tipo(8))
);

CREATE TABLE usuarios
(
	id_usuario char(8) PRIMARY KEY not null,
	id_tipo char(8) not null,
	nombres_u varchar(120) not null,
	apellidos_u varchar(120) not null,
	usuario_u varchar(80) not null,
	correo_u varchar(180) not null,
	contrasenia_u varchar(30) not null,
	fecha_nac_u date not null,
	telefono_u varchar(15) not null,
	direccion_u varchar(500) not null,
	foto_u varchar(500) null,
	estado_u smallint not null
);

CREATE TABLE registro_ing
(
	id int AUTO_INCREMENT PRIMARY KEY,
	id_usuario int not null,
	fecha_ing datetime,
	ip_ing varchar(30)
);

CREATE TABLE recuperar
(
	id_tipo char(8) PRIMARY KEY not null,
	ip_recup varchar(30) not null,
	fecha_recup datetime not null,
	nombres_recup varchar(120) not null,
	apellidos_recup varchar(120) not null,
	correo_recup varchar(180) not null,
	fecha_nac_recup date not null
);

CREATE TABLE blocked_ip
(
	id_ip_block int PRIMARY KEY,
	ip_block varchar(30) not null,
	detalle_block varchar(700) not null
);
/*  
-----------------------------------
Fin de la Creación de la Base datos
-----------------------------------
*/

/*  
------------------------------------------
Creación de los procedimientos almacenados
------------------------------------------
*/

	CREATE PROCEDURE usp_buscar_blocked_ip
		(
			ip varchar(30)
		)
		SELECT * FROM blocked_ip
		WHERE ip_block like ip
	;

	CREATE PROCEDURE usp_usuarios_login
		(
	 		usuario varchar(180),
	 		contra varchar(30)
	 	)
		SELECT u.id_usuario, u.id_tipo, tu.nombre_tipo, u.nombres_u, u.apellidos_u, u.usuario_u, u.correo_u, u.contrasenia_u, u.fecha_nac_u, 
			u.telefono_u, u.direccion_u, u.foto_u, u.estado_u
		FROM usuarios u inner join tipo_usuario tu on id_tipo like id_tipo
		WHERE ( correo_u like usuario or usuario_u like usuario ) and contrasenia_u like contra and estado = 1
	;

	CREATE PROCEDURE usp_registro_insert
		(
			id_usuario int,
			fecha_ing datetime,
			ip_ing varchar(30)
		)
		INSERT INTO registro_ing (id_usuario, fecha_ing, ip_ing)
		VALUES (id_usuario, fecha_ing, ip_ing)
	;

/*  
----------------------------------------------------
Fin de la Creación de los procedimientos almacenados
----------------------------------------------------
*/
