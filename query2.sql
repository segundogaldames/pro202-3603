select * from comunas;
select * from empleados;

insert INTO empleados(rut,nombre,fecha_nac,direccion,email,comuna_id,rol_id) VALUES('20900600-3','Javiera Gonzalez','2001-02-15','Argomedo 102','jgonzalez@gmail.com',4,1);

--query multitablas y uso de alias
-- alias de campo o columna que sirven para denominar de otra manera un campo
-- alias de tabla sirven para denominar de otra a una tabla

select e.id, e.nombre, e.rut, c.nombre as comuna, r.nombre as rol from empleados e
INNER JOIN comunas as c ON e.comuna_id = c.id
INNER JOIN roles r ON e.rol_id = r.id;

create TABLE telefonos(
    id int NOT NULL PRIMARY key auto_increment,
    numero int not NULL,
    movil int not null,
    telefonoable_id int not null,
    telefonoable_type varchar(20)
);

CREATE TABLE usuarios(
    id int not null PRIMARY key auto_increment,
    activo int not null,
    empleado_id int not null UNIQUE,
    FOREIGN KEY(empleado_id) REFERENCES empleados(id)
);

-- modificar un campo, modificando la restriccion not null
alter table telefonos modify telefonoable_type varchar(20) not null;

--agregar el campo clave a la tabla usuarios, despues del campo id
ALTER TABLE usuarios add COLUMN clave varchar(255) not null AFTER id;


DESC usuarios;

INSERT INTO usuarios(clave,activo,empleado_id) VALUES(sha('jgonzalez.123'),1,2);

--modificar la clave
update usuarios SET clave = SHA('jgonzalez.123') WHERE empleado_id = 2;

select * from comunas;


--login: correo y su clave
select u.id as usuario_id, e.nombre as usuarios
from usuarios u
inner join empleados e ON u.empleado_id = e.id
WHERE e.email = 'jgonzalez@gmail.com' AND u.clave = SHA('jgonzalez.123') AND u.activo = 1;

update usuarios set activo = 2 where id = 1;

delete from usuarios where id = 1;

desc empleados;

ALTER TABLE empleados modify email varchar(100) not null UNIQUE;

select id from empleados where rut like '%12968521%';

use ferreteria;

select * from comunas;
