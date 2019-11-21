create database Savino_DB
go

use Savino_DB
go

create table tipos(
	id int not null primary key identity(1, 1),
	nombre varchar(64) not null
)
go

create table usuarios(
	id int not null primary key identity(1, 1),
	idtipo int not null FOREIGN KEY REFERENCES tipos(id),
	nombre varchar(64) not null,
	apellido varchar(64) not null,
	clave varchar(64) not null,
	email varchar(64) not null,
	estado bit not null
)
go

create table pacientes(
	id int not null primary key identity(1, 1),
	dni int not null,
	nombre varchar(64) not null,
	apellido varchar(64) not null,
	telefono int not null,
	fechanac date not null,
	sexo varchar(1) not null CHECK(sexo IN ('F', 'M')),
	estado bit not null
)
go

create table turnos(
	id bigint not null primary key identity(1, 1),
	fecha date not null,
	hora varchar(5) not null,
	idpaciente int not null FOREIGN KEY REFERENCES pacientes(id),
	idreiki int not null FOREIGN KEY REFERENCES usuarios(id),
	estado varchar(16) not null check(estado in ('en espera', 'concurrido', 'cancelado'))
)
go

create table pagos(
	id int not null primary key identity(1, 1),
	nombre varchar(64) not null
)
go

create table precios(
	id int not null primary key identity(1, 1),
	precio money not null
)
go

create table tickets(
	id bigint not null primary key identity(1, 1),
	idturno bigint not null FOREIGN KEY REFERENCES turnos(id),
	fecha datetime not null,
	idpago int not null FOREIGN KEY REFERENCES pagos(id),
	idprecio int not null FOREIGN KEY REFERENCES precios(id)
)
go

--Insert--
--Tipos de usuarios--
insert into tipos values('Reiki')
insert into tipos values('Admin')
--Usuarios
insert into usuarios values(1, 'Fede', 'Parrotta', 'Shaco', 'Payasito@gmail.com', 1)
insert into usuarios values(2, 'Seba', 'Montoya', 'Cuervo', 'Fumado@gmail.com', 1)
--Pacientes--
insert into pacientes values(1111, 'Ary', 'Segovia', 1111, '12/12/2019', 'M', 1)
insert into pacientes values(2222, 'Christian', 'savino', 2222, '11/11/2019', 'M', 1)
insert into pacientes values(3333, 'The', 'Bird', 3333, '10/10/2019', 'F', 1)
--Turnos--
insert into turnos values('22/10/2019', '12:05' , 3, 1, 'concurrido')
--Tipo de pago--
insert into pagos values('Efectivo')
insert into pagos values('Debito')
insert into pagos values('Credito')
--Precios--
insert into precios values(100)
insert into precios values(200)
insert into precios values(300)
--Tickets-
insert into tickets values(1, '22/10/2019', 1, 1)
