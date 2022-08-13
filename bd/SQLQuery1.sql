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
delete estudiante
where id_estudiante = @id
end