CREATE DATABASE MedicalGroup_Manhã;

USE MedicalGroup_Manhã; 
Go

CREATE TABLE Clinica(
IdCliente			INT PRIMARY KEY IDENTITY,
NomeClinica			VARCHAR (255) UNIQUE,
);

Go

CREATE TABLE Endereco(
IdEndereco			INT PRIMARY KEY IDENTITY,
Logradouro			VARCHAR(255),
Bairro				VARCHAR (255),
CEP                 VARCHAR(255),
NCasa				INT,
Complemento			VARCHAR(255),
Estado				VARCHAR(255),
Cidade				VARCHAR(255),
);
Go

CREATE TABLE TipoUsuario(
IdTipoUsuaio INT PRIMARY KEY IDENTITY,
NomeTipoUsuario VARCHAR (255)
);
Go

CREATE TABLE Genero(
IdGenero			INT PRIMARY KEY IDENTITY,
NomeGenero			VARCHAR(255)
);
Go

CREATE TABLE StatusAndamento(
IdStatusAndamento INT PRIMARY KEY IDENTITY,
NomeStatusAndamento VARCHAR(255)
);
Go

CREATE TABLE Especialidade(
IdEspecialidade INT PRIMARY KEY IDENTITY,
NomeEspecialidade VARCHAR(255)
);
Go

CREATE TABLE Usuario (
IdUsuario INT PRIMARY KEY IDENTITY,
IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario),
Email				VARCHAR(255),
Senha				VARCHAR(255)
);
Go

CREATE TABLE Medico(
IdMedico INT PRIMARY KEY IDENTITY,
NomeMedico		VARCHAR(255),
CRM				CHAR(15),
CNPJ			VARCHAR(255),
RazaoSocial		VARCHAR(255),
IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade(IdEspecialidade),
IdUsuario  INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
IdGenero INT FOREIGN KEY REFERENCES Genero(IdGenero)
);
Go

CREATE TABLE Consulta(
IdConsulta INT PRIMARY KEY IDENTITY,
DtConsulta DATE,
IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente),
IdMedico INT FOREIGN KEY REFERENCES Medico(IdMedico),
IdStatusAndamento INT FOREIGN KEY REFERENCES StatusAndamento(IdStatusAndamento)
);
Go

CREATE TABLE Paciente(
IdPaciente INT PRIMARY KEY IDENTITY,
NomePaciente VARCHAR (255),
DtNascimento DATE,
Telefone VARCHAR(255),
CPF VARCHAR(255),
RG CHAR(15),
IdEndereco INT FOREIGN KEY REFERENCES Endereco(IdEndereco),
IdGenero INT FOREIGN KEY REFERENCES Genero(IdGenero),
IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario)
);