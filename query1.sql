create database ferreteria;

show databases;
use ferreteria;

create table roles(
	id int not null primary key auto_increment,
    nombre varchar(20) not null
);

create table regiones(
	id int not null primary key auto_increment,
    nombre varchar(50) not null
);

create table comunas(
	id int not null primary key auto_increment,
    nombre varchar(50) not null,
    region_id int not null,
    constraint FK_regiones foreign key(region_id) references regiones(id)
);

create table empleados(
    id int not null primary key auto_increment,
    rut varchar(20) not null,
    nombre varchar(50) not null,
    fecha_nac date,
    direccion varchar(255) not null,
    email varchar(100),
    comuna_id int not null,
    rol_id int not null,
    constraint FK_comunas foreign key(comuna_id) references comunas(id),
    constraint FK_roles foreign key(rol_id) references roles(id)
);

show tables;


#instruccion para mostrar la estructura de la tabla
desc comunas;

-- insercion de datos con campo especifico
insert into roles(nombre) values('Administrador');

insert into regiones(nombre) values('Metropolitana de Santiago');
insert into regiones(nombre) values('Libertador General Bernardo Ohiggins');
insert into regiones(nombre) values('Coquimbo');
insert into regiones(nombre) values('Del Maule');
insert into regiones(nombre) values('Del Bio Bio');

insert into comunas(nombre, region_id) values('Santiago',1);
insert into comunas(nombre, region_id) values('Lo Barnechea',1);
insert into comunas(nombre, region_id) values('Talagante',1);
insert into comunas(nombre, region_id) values('Curico',4);
insert into comunas(nombre, region_id) values('Peor Es Nada',2);
insert into comunas(nombre, region_id) values('La Serena',3);

/* 
	insercion masiva de datos
    peligrosa desde el punto de vista de la seguridad de datos
*/
insert into roles values(null,'Vendedor');

select * from comunas;
