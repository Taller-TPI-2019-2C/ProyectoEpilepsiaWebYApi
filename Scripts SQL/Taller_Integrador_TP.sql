/* 
-- CORRER ESTO PARA DROPEAR LA BDD SI YA EXISTE (NOMBRE DE LA BDD ES TEMPORAL)
USE MASTER
GO
DROP DATABASE TALLER_INTEGRADOR_TP
GO
*/

CREATE DATABASE TALLER_INTEGRADOR_TP
GO
USE TALLER_INTEGRADOR_TP
GO

/* ****************************************************************************
********************************[TABLAS ABAJO!]********************************
******************************************************************************/

/*Esta tabla representa simplemente los datos para que un usuario pueda iniciar sesión.

RELACIONES
==========
'Login' <(1)---(Le pertenece a)---(1)> 'Usuario'.

- SE ME PERDIÓ LA IDEA DE LA COLUMNA DE LOGIN_API, BIEN LA UTILIDAD. ACLAREN CUANDO PUEDAN
(SIMPLEMENTE LO ESTOY PONIENDO COMO BOOLEAN EN FALSO POR DEFAULT)*/
CREATE TABLE Login(
	Id BIGINT IDENTITY(1,1) NOT NULL,
	Usuario VARCHAR(MAX) NOT NULL,
	Contrasenia VARCHAR(MAX) NOT NULL,
	Login_Api BIT DEFAULT 'FALSE',	-- ?? (Qué guardaría exactamente?)
	CONSTRAINT PK_Login_Id PRIMARY KEY (Id)
)
GO

/*Esta tabla representa los datos del usuario. 

RELACIONES
==========
'Usuario' <(1)---(Tiene datos de)---(1)> 'Login'.
'Usuario' <(1)---(Tiene datos de)---(N)> 'Registro_Episodio'.
'Usuario' <(1)---(Tiene un)---(1)> 'Telefono'.
'Usuario' <(1)---(Dispara)---(N)> 'Alertas'.
'Usuario' <(1)---(Recibe)---(N)> 'Alertas'.
'Usuario' <(1)---(Tiene datos de)---(1)> 'Tratamiento'.

- 'Nombre', 'Apellido' Y 'Edad' LOS DEJE QUE PUEDAN SER NULL PORQUE NO ESTOY SEGURO 
QUE PASARÍA SI TE LOGEAS CON ALGO EXTERNO (EJ. FB)
- NO ESTOY SEGURO DEL USO DE LA TABLA 'Configuración'. SI LA RELACION ES 1-1, LA ID DEL 
USER PUEDE IR HACIA ESA TABLA, SI NO ES ASI. HABRÍA QUE VER BIEN LO QUE SE QUIERE HACER
*/

CREATE TABLE Usuario(
	Id BIGINT IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(MAX),
	Apellido VARCHAR(MAX),
	Edad INTEGER,	
	Estado BIT DEFAULT 'FALSE',
	Tipo_Usuario VARCHAR(MAX) DEFAULT 'PACIENTE',
	Id_Login BIGINT NOT NULL,
	CONSTRAINT PK_Usuario_Id PRIMARY KEY (Id),
	CONSTRAINT FK_Usuario_Login FOREIGN KEY (Id_Login) REFERENCES Login (Id)
)
GO

/*Esta tabla guarda registros todas las crisis de los usuarios

RELACIONES
==========
'Registro_Episodio' <(N)---(Le pertenece a)---(1)> 'Usuario'.
*/

CREATE TABLE Registro_Episodio(
	Id BIGINT IDENTITY(1,1) NOT NULL,
	Fecha DATETIME,
	Duracion DECIMAL(6,2),
	Id_Usuario BIGINT NOT NULL,
	CONSTRAINT PK_Registro_Id PRIMARY KEY (Id),
	CONSTRAINT FK_Registro_Usuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario (Id)
)
GO

/*Esta tabla guarda los telefónos de los usuarios de la aplicación

RELACIONES
==========
'Telefono' <(1)---(Le pertenece a)---(1)> 'Usuario'.

- PUSE 'Numero' COMO VARCHAR PORQUE NO SE SI EL TELEFONO AGREGARÍA EL PREFIJO ESTILO
'+54 12345...'
*/

CREATE TABLE Telefono(
	Id BIGINT IDENTITY(1,1) NOT NULL,
	Numero VARCHAR(MAX) NOT NULL,
	Id_Usuario BIGINT NOT NULL,
	CONSTRAINT PK_Telefono_Id PRIMARY KEY (Id),
	CONSTRAINT FK_Telefono_Usuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario (Id)
)
GO

/*Esta tabla tiene los datos de cada alerta. Se entiende que si un paciente tiene mas de 
un tutor, envía N alertas. Un registro de esta tabla es solo UNA alerta en particular 
(aviso a una sola persona)

RELACIONES
==========
'Alerta' <(N)---(Es disparada por)---(1)> 'Usuario'.
'Alerta' <(N)---(Es recibida por)---(1)> 'Usuario'.

- QUÉ PASA EN EL CASO DE LOS DATOS 'Duracion' Y 'Fecha'? AMBOS ESTAN EN LA TABLA DE REGISTRO. 
CUÁL SERÍA LA DIFERENCIA??
*/

CREATE TABLE Alerta(
	Id BIGINT IDENTITY(1,1) NOT NULL,
	Tipo_Alerta VARCHAR(MAX) NOT NULL,
	-- Duracion DECIMAL(6,2), -- ?? (Esta en registro también)
	-- Fecha DATETIME, -- ?? (Esta en registro también)
	Id_Usuario_Paciente BIGINT NOT NULL,
	Id_Usuario_Tutor BIGINT NOT NULL,
	CONSTRAINT PK_Alerta_Id PRIMARY KEY (Id),
	CONSTRAINT FK_Usuario_Paciente FOREIGN KEY (Id_Usuario_Paciente) REFERENCES Usuario (Id),
	CONSTRAINT FK_Usuario_Tutor FOREIGN KEY (Id_Usuario_Tutor) REFERENCES Usuario (Id))
GO

/*Esta tabla tiene datos del tratamiento para un usuario. Por ejemplo, datos de medicamentos 
que toma.

RELACIONES
==========
'Tratamiendo' <(1)---(Corresponde a)---(1)> 'Usuario'.

- DUDAS CON RESPECTO AL TIPO DE DATOS DE LA DOSIS Y CADA CUANTO TOMA
- CUÁL SERÍA EL PUNTO DE RELACIONAR ESTA TABLA CON LA DE ALERTAS?
*/

CREATE TABLE Tratamiento(
	Id BIGINT IDENTITY(1,1) NOT NULL,
	Fecha_Inicio DATETIME NOT NULL,
	Fecha_Fin DATETIME,
	Medicamento VARCHAR(MAX),
	Toma_Cada VARCHAR(MAX), -- ?? (Tipo de dato?)
	Dosis VARCHAR(MAX), -- ?? (Tipo de dato?),
	-- Id_Alerta -- ?? (No entendí porque estaría aca)
	Id_Usuario BIGINT NOT NULL,
	CONSTRAINT PK_Tratamiendo_Id PRIMARY KEY (Id),
	CONSTRAINT FK_Tratamiento_Usuario FOREIGN KEY (Id_Usuario) REFERENCES Usuario (Id)
)
GO

/*LA TABLA DE CONFIGURACIÓN SOLO TIENE COMO CAMPO LA ID DE UNA ALERTA, NO LA AGREGÉ AL SCRIPT 
POR QUE NO ENTENDÍ LA UTILIDAD DE ESO. ASUMO QUE SERÍA LA TABLA QUE GUARDA DATOS PARA 
VINCULAR USUARIOS ASÍ SE SABE A QUIEN LE DISPARAS LA ALARMA. LA COSA ES QUE EN EL EXCEL HAY UN 
'Tipo_Alerta' EN LA TABLA 'Alerta'. QUISIERA ACLARAR BIEN EL TEMA PORQUE ESE CAMPO SE REPITE.

TAMPOCO ESTOY SEGURO SI LA MAYORIA DE LAS TABLAS DEBERIAN APUNTAR A LA ID DEL USER O A LA ID 
DEL LOGIN*/






