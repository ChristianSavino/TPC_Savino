use master
go
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
	email varchar(100) not null,
	clave varchar(100) not null,
	estado bit not null
)
go

create table turnos(
	id bigint not null primary key identity(1, 1),
	fecha date not null,
	hora varchar(5) not null,
	idpaciente int not null FOREIGN KEY REFERENCES pacientes(id),
	idreiki int not null FOREIGN KEY REFERENCES usuarios(id),
	estado varchar(16) not null check(estado in ('en espera', 'concurrido', 'cancelado', 'abonado'))
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
insert into tipos values('Reikista')
--Usuarios
insert into usuarios values(1, 'Christian', 'Savino', 'Keru18111997', 'christiansavino1811@gmail.com', 1)
insert into usuarios values(1, 'Lucas', 'Conti', 'Vento2010', 'lucasok3007@gmail.com', 1)
--Pacientes--
insert into pacientes values(40834656, 'Roberto', 'Planta', 1558056089, '18/11/1997', 'M', 'elkeruforever@gmail.com','Keru18111997',1)
insert into pacientes values(17830484, 'Matias', 'Sterzer', 21830454, '06/12/1997', 'M', 'sterzermatias@gmail.com','123456',1)
insert into pacientes values(12345678, 'Maxi', 'Aprobame', 1503455878, '01/01/1975', 'F','maxiutn@gmail.com','666',1)
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
go

Create Procedure spInsertarUsuario @idtipo int, @nombre varchar(64), @apellido varchar(64), @clave varchar(64), @email varchar(64)
as
Begin
Insert Into usuarios (idtipo,nombre,apellido,clave,email,estado) values (@idtipo,@nombre,@apellido,@clave,@email,1)
end
go

Create Procedure spInsertarTurno @fecha date, @hora varchar(5), @idpaciente int, @idreiki int
as
Begin
insert into turnos (fecha,hora,idpaciente,idreiki,estado) values (@fecha,@hora,@idpaciente,@idreiki,'en espera')
end
go

Create Procedure spInsertarTicket @id bigint, @precio int, @pago int
as
Begin
insert into tickets (idturno,idprecio,idpago,fecha) values ((Select t.id from turnos t left join pacientes p on t.idpaciente = p.id where p.id = @id),@precio,@pago,GETDATE())
end
go

Create Procedure spInsertarPaciente @dni int,@nombre varchar(64),@apellido varchar(64),@telefono int,@fecha date, @sexo varchar(1),@email varchar(100), @clave varchar(100)
as
Begin
insert into pacientes (dni,nombre,apellido,telefono,fechanac,sexo,estado,email,clave) values (@dni,@nombre,@apellido,@telefono,@fecha,@sexo,1,@email,@clave)
end
go
