create database GestionAcademica

use GestionAcademica


create table estudiante(
	id_estudiante int not null identity(1,1) Primary Key,
	nombre varchar(50) not null ,
	apellido varchar(50) not null, 
	cedula varchar(50) unique
)

create table matricula(
	id_matricula int not null identity(1,1) Primary Key,
	id_estudiante int not null ,
	id_carrera int not null,
	id_periodo int not null,
	fecha_matricula date,
	codigo varchar(10)
)

create table periodo(
	id_periodo int not null identity(1,1) Primary Key,
	fecha_inicio date,
	fecha_cierre date,
	actual bit
)

create table carrera(
	id_carrera int not null identity(1,1) Primary Key,
	nombre varchar(50),
	departamento varchar(50)
)

create table semestre(
	id_semestre int not null identity(1,1) Primary Key,
	nivel varchar(10),
	id_carrera int not null
)

create table materia(
	id_materia int not null identity(1,1) Primary Key,
	nombre varchar(50),
	id_profesor int not null,
	id_semestre int not null
)

create table profesor(
	id_profesor int not null identity(1,1) Primary Key,
	nombre varchar(50) not null ,
	apellido varchar(50) not null, 
	cedula varchar(50) unique 
)


/* claves de matricula  */
Alter table matricula add foreign key (id_estudiante) references estudiante (id_estudiante)

Alter table matricula add foreign key (id_carrera) references carrera (id_carrera)

Alter table matricula add foreign key (id_periodo) references periodo (id_periodo)

/* claves de semestre  */
Alter table semestre add foreign key (id_carrera) references carrera (id_carrera)


/* claves de materia  */
Alter table materia add foreign key (id_profesor) references profesor (id_profesor)
Alter table materia add foreign key (id_semestre) references semestre (id_semestre)



go 
create procedure inserta_estudiante
@nombre varchar(50) ,
@apellido varchar(50) ,
@cedula varchar(50) 
as 
begin 
insert estudiante 
select @nombre,@apellido,@cedula
end 

go 
create procedure obtener_estudiante
as
begin
select * from estudiante order by apellido desc 
end

go 
create procedure editar_estudiante
@id int,
@nombre varchar(50),
@apellido varchar(50),
@cedula  varchar(50)
as
begin
update estudiante
set nombre = @nombre, apellido = @apellido, cedula = @cedula
where id_estudiante = @id
end

go 
create procedure eliminar_estudiante
@id int
as
begin
delete from estudiante
where id_estudiante = @id
end

/*matricula*/
go
create procedure insertar_matricula
@id_estudiante int,
@id_carrera int,
@id_periodo int,
@fecha_matricula date,
@codigo varchar(10)
as
begin
insert matricula
select @id_estudiante,@id_carrera,@id_periodo,@fecha_matricula,@codigo
end

go
create procedure obtener_matricula
as
begin
select * from matricula order by fecha_matricula desc 
end

go
create procedure editar_matricula
@id int, 
@id_estudiante int,
@id_carrera int,
@id_periodo int,
@fecha_matricula date,
@codigo varchar(10)
as
begin
update matricula
set id_estudiante =@id_estudiante, id_carrera = @id_carrera,
id_periodo = @id_periodo, fecha_matricula = @fecha_matricula ,
codigo = @codigo
where id_matricula = @id
end

go
create procedure eliminar_matricula
@id int
as
begin
delete from matricula
where id_matricula = @id
end

/*periodo*/
go
create procedure insertar_periodo
@fecha_inicio date,
@fecha_cierre date,
@actual bit 
as
begin
insert periodo
select @fecha_inicio, @fecha_cierre, @actual
end

go
create procedure obtener_periodo
as
begin
select * from periodo order by fecha_inicio desc 
end

go
create procedure editar_periodo
@id int, 
@fecha_inicio date,
@fecha_cierre date,
@actual bit 
as
begin
update periodo
set fecha_inicio = @fecha_inicio, fecha_cierre = @fecha_cierre, 
actual = @actual
where id_periodo = @id
end

go
create procedure eliminar_periodo
@id int
as
begin
delete from periodo
where id_periodo = @id
end

/*Carrera*/
go
create procedure insertar_carrera
@nombre varchar(50),
@departamento varchar(50) 
as
begin
insert carrera
select @nombre, @departamento
end

go
create procedure obtener__carrera
as
begin
select * from carrera order by departamento desc 
end

go
create procedure editar_carrera
@id int, 
@nombre varchar(50),
@departamento varchar(50) 
as
begin
update carrera
set nombre = @nombre, departamento = @departamento
where id_carrera = @id
end

go
create procedure eliminar_carrera
@id int
as
begin
delete from carrera
where id_carrera = @id
end
/*semestre*/
go
create procedure insertar_semestre
@nivel varchar(10),
@id_carrera int 
as
begin
insert semestre
select @nivel, @id_carrera
end

go
create procedure obtener__semestre
as
begin
select * from semestre order by id_semestre desc 
end

go
create procedure editar_semestre
@id int, 
@nivel varchar(10),
@id_carrera int 
as
begin
update semestre
set nivel = @nivel, id_carrera = @id_carrera
where id_semestre = @id
end

go
create procedure eliminar_semestre
@id int
as
begin
delete from semestre
where id_semestre = @id
end
/*materia*/
go
create procedure insertar_materia
@nombre varchar(50),
@id_profesor int,
@id_semestre int 
as
begin
insert materia
select @nombre, @id_profesor,@id_semestre
end

go
create procedure obtener__materia
as
begin
select * from materia order by nombre desc 
end

go
create procedure editar_materia
@id int, 
@nombre varchar(50),
@id_profesor int,
@id_semestre int 
as
begin
update materia
set nombre = @nombre, id_profesor = @id_profesor, id_semestre= @id_semestre
where id_materia = @id
end

go
create procedure eliminar_materia
@id int
as
begin
delete from materia
where id_materia = @id
end
/*profesor*/
go 
create procedure inserta_profesor
@nombre varchar(50) ,
@apellido varchar(50) ,
@cedula varchar(50) 
as 
begin 
insert profesor 
select @nombre,@apellido,@cedula
end 

go 
create procedure obtener_profesor
as
begin
select * from profesor order by apellido desc 
end

go 
create procedure editar_profesor
@id int,
@nombre varchar(50),
@apellido varchar(50),
@cedula  varchar(50)
as
begin
update profesor
set nombre = @nombre, apellido = @apellido, cedula = @cedula
where id_profesor = @id
end

go 
create procedure eliminar_profesor
@id int
as
begin
delete from profesor
where id_profesor = @id
end