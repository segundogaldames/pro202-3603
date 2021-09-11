CREATE Table clientes(
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rut VARCHAR(20) not NULL,
    nombre VARCHAR(200) not NULL,
    email VARCHAR(100) not NULL,
    empresa int NOT NULL,
    direccion VARCHAR(255),
    comuna_id int NOT NULL,
    FOREIGN KEY(comuna_id) REFERENCES comunas(id)
);

desc clientes;
select * from empleados;


--empresa = 1 y no empresa = 2
insert into clientes(rut,nombre,email,empresa,comuna_id) values('18890300-0','Noemi Caceres','ncaceres@movistar.cl',2,4);

insert into
  clientes(rut, nombre, email, empresa, direccion,comuna_id)
values(
    '79652187-6',
    'Constructora JK',
    'contacto@constructorajk.cl',
    1,
    'Los Abetos 322',
    3
  );

  desc telefonos;

  insert into telefonos(numero,movil,telefonoable_id,telefonoable_type) values(25686007,2,2,'empleados');

  SELECT
  round(avg(TIMESTAMPDIFF(YEAR, fecha_nac, CURDATE())),1) AS edad
FROM
  empleados;

  select * from empleados;
