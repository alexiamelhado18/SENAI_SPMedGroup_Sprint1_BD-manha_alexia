CREATE DATABASE MedicalGroup_Manhã;

--DDL

USE MedicalGroup_Manhã; 
Go

CREATE TABLE Clinica(
IdCliente			INT PRIMARY KEY IDENTITY,
NomeClinica			VARCHAR (255) UNIQUE NOT NULL,
HoraAbertura		TIME,
HoraFechamento		TIME,
IdEndereco INT FOREIGN KEY REFERENCES Endereco(IdEndereco)
);
Go

CREATE TABLE Usuario (
IdUsuario INT PRIMARY KEY IDENTITY,
IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario),
Email				VARCHAR(255) UNIQUE NOT NULL,
Senha				VARCHAR(255) NOT NULL
);
Go



CREATE TABLE TipoUsuario(
IdTipoUsuario			INT PRIMARY KEY IDENTITY,
NomeTipoUsuario			VARCHAR (255) UNIQUE
);
Go

CREATE TABLE Medico(
IdMedico INT PRIMARY KEY IDENTITY,
NomeMedico		VARCHAR(255) NOT NULL,
CRM				VARCHAR(255) NOT NULL,
CNPJ			VARCHAR(255) NOT NULL,
RazaoSocial		VARCHAR(255) NOT NULL,
IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade(IdEspecialidade),
IdUsuario  INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
IdGenero INT FOREIGN KEY REFERENCES Genero(IdGenero)
);
Go

CREATE TABLE Especialidade(
IdEspecialidade INT PRIMARY KEY IDENTITY,
NomeEspecialidade VARCHAR(255) UNIQUE
);
Go

CREATE TABLE Paciente(
IdPaciente		INT PRIMARY KEY IDENTITY,
NomePaciente	VARCHAR (255) NOT NULL,
DtNascimento	DATE NOT NULL,
Telefone		VARCHAR(255) NOT NULL,
CPF				CHAR(11) UNIQUE NOT NULL,
RG				CHAR(9) UNIQUE NOT NULL,
IdEndereco		INT FOREIGN KEY REFERENCES Endereco(IdEndereco),
IdGenero		INT FOREIGN KEY REFERENCES Genero(IdGenero),
IdUsuario		INT FOREIGN KEY REFERENCES Usuario(IdUsuario)
);



CREATE TABLE Genero(
IdGenero			INT PRIMARY KEY IDENTITY,
NomeGenero			VARCHAR(255) UNIQUE
);
Go



CREATE TABLE Endereco(
IdEndereco			INT PRIMARY KEY IDENTITY,
Logradouro			VARCHAR(255),
Bairro				VARCHAR (255),
CEP                 VARCHAR(255),
NCasa				VARCHAR(100),
Complemento			VARCHAR(100),
Estado				VARCHAR(255),
Cidade				VARCHAR(255),
);
Go
select *from Endereco

CREATE TABLE Consulta(
IdConsulta INT PRIMARY KEY IDENTITY,
DtConsulta DATE NOT NULL,
IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente),
IdMedico INT FOREIGN KEY REFERENCES Medico(IdMedico),
IdStatusAndamento INT FOREIGN KEY REFERENCES StatusAndamento(IdStatusAndamento)
);
Go


CREATE TABLE StatusAndamento(
IdStatusAndamento INT PRIMARY KEY IDENTITY,
NomeStatusAndamento VARCHAR(255) UNIQUE
);
Go



