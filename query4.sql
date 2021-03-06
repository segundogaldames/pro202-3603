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



select * from empleados_comuna;


