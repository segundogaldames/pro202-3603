INSERT INTO
  regiones(nombre)
VALUES('De la Araucania');

delete from regiones where id BETWEEN 7 and 9;

alter Table clientes drop constraint clientes_ibfk_1;

desc comunas;

alter Table clientes add foreign key (comuna_id) references comunas(id) on delete cascade;

ALTER Table clientes drop KEY `comuna_id`;

alter table comunas modify foreign key(comuna_id) references comunas(id);

truncate usuarios;

INSERT INTO
  regiones(nombre)
VALUES('Metropolitana de Santiago');

--agregar una restriccion de tipo unique para evitar nombre de comunas duplcadas
ALTER Table comunas modify nombre varchar(50) not null unique;

ALTER Table
  empleados
modify
  rut varchar(20) not null unique;

INSERT INTO
  comunas(nombre, region_id)
VALUES('Curico', 4);

ALTER Table empleados drop KEY `rut_2`;


INSERT INTO
  empleados(
    rut,
    nombre,
    fecha_nac,
    direccion,
    email,
    comuna_id,
    rol_id
  )
VALUES(
    '20900600-3',
    'Javiera Gonzalez',
    '2001-02-15',
    'Argomedo 102',
    'jgonzalez@gmail.com',
    4,
    1
  );


select e.rut, e.nombre, c.nombre as comuna, r.nombre as region, v.fecha_hora as fecha
from empleados e
INNER JOIN comunas c ON e.comuna_id = c.id
INNER JOIN regiones r ON r.id = c.region_id
LEFT JOIN usuarios u ON e.id = u.empleado_id
LEFT JOIN ventas v ON v.usuario_id = u.id;

create Table ventas(
  id int not null PRIMARY KEY AUTO_INCREMENT,
  fecha_hora DATETIME not NULL,
  usuario_id INT NOT NULL,
  cliente_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

create View empleados_comuna as
  select
  e.rut,
  e.nombre,
  c.nombre as comuna,
  r.nombre as region,
  v.fecha_hora as fecha
  from
    empleados e
    INNER JOIN comunas c ON e.comuna_id = c.id
    INNER JOIN regiones r ON r.id = c.region_id
    LEFT JOIN usuarios u ON e.id = u.empleado_id
    LEFT JOIN ventas v ON v.usuario_id = u.id;


select * from empleados_comuna ORDER BY comuna DESC;

--calcular el total de ventas de una fecha
select monthname(fecha_hora) as fecha, count(id) as cuenta from ventas
where fecha_hora >= '2021-09-25'
GROUP BY fecha;


select count(id) as total from telefonos where telefonoable_type = 'empleados';



create view empl_comunas  as
select c.nombre as comuna, COUNT(e.id) as total
FROM empleados e INNER JOIN comunas c
on e.comuna_id = c.id
GROUP BY comuna;

SELECT * FROM empl_comunas;

INSERT INTO
  usuarios(clave, activo, empleado_id)
VALUES(sha1('123456'), 1, 2);

select e.nombre as usuario, u.activo from empleados e INNER JOIN usuarios u ON e.id = u.empleado_id;

INSERT INTO
  usuarios(clave, activo, empleado_id)
VALUES(sha1('Kjara.123'), 1, 5);

ALTER table ventas modify cliente_id int;

INSERT INTO
  ventas(fecha_hora, usuario_id, cliente_id)
VALUES(now(), 2, NULL);

INSERT INTO
  usuarios(clave, activo, empleado_id)
VALUES(sha1('Lperez.123'), 1, 4);

select
  c.nombre as comuna,
  COUNT(e.id) as total
FROM
  empleados e
  INNER JOIN comunas c on e.comuna_id = c.id
GROUP BY
  comuna
  order by comuna DESC;

  select
  e.nombre,
  count(v.id) as total
from
  ventas v
  inner join usuarios u on v.usuario_id = u.id
  inner join empleados e on e.id = u.empleado_id
where
  e.rut = '14632870-K';

  select
  e.nombre as empleado
from
  empleados e
  inner join usuarios u ON u.empleado_id = e.id
  inner join ventas v ON v.usuario_id = u.id
where
  e.rut = '18745600-1';

  select
  distinct e.nombre as empleado
from
  empleados e
  inner join usuarios u ON u.empleado_id = e.id
  inner join ventas v ON v.usuario_id = u.id
where
  e.rut = '18745600-1';

  INSERT INTO
  clientes(rut, nombre, email, empresa, direccion, comuna_id)
VALUES(
    '96983012-K',
    'Alarcon SA',
    'jalarcon@gmail.com',
    1,
    'Los Pinguinos 444',
    6
  );

  UPDATE
  ventas
SET
  cliente_id = NULL
WHERE
  id = 1;