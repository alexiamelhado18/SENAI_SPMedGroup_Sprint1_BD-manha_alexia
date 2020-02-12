--DQL

USE MedicalGroup_Manhã; 
Go

SELECT Endereco.*,Clinica.NomeClinica,Clinica.HoraAbertura,Clinica.HoraFechamento
FROM Clinica
INNER JOIN Endereco ON Endereco.IdEndereco = Clinica.IdEndereco;

SELECT TipoUsuario.NomeTipoUsuario FROM Usuario 
INNER JOIN TipoUsuario ON TipoUsuario.IdTipoUsuario = Usuario.IdTipoUsuario;

SELECT TipoUsuario.NomeTipoUsuario,Medico.NomeMedico FROM Usuario 
INNER JOIN Medico ON Medico.IdUsuario = Usuario.IdUsuario
INNER JOIN TipoUsuario ON TipoUsuario.IdTipoUsuario = Usuario.IdTipoUsuario;

SELECT  Medico.NomeMedico,Medico.CNPJ,Medico.CRM,Medico.IdEspecialidade,
Medico.IdMedico,
Medico.IdUsuario,
Medico.RazaoSocial, 
Especialidade.NomeEspecialidade,
Genero.NomeGenero 
FROM Medico 
INNER JOIN Genero ON Genero.IdGenero = Medico.IdGenero
INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade;


SELECT Endereco.*,
Genero.NomeGenero,
Paciente.CPF,
Paciente.DtNascimento,
Paciente.IdUsuario,
Paciente.RG,
Paciente.Telefone,
Paciente.NomePaciente,
Paciente.IdPaciente
FROM Paciente 
INNER JOIN Endereco ON Endereco.IdEndereco = Paciente.IdEndereco
INNER JOIN Genero ON Genero.IdGenero = Paciente.IdGenero;


-- Mostra Medico e sua especialidade

CREATE PROCEDURE Quantidade 
@contagem INT 
AS
SELECT Especialidade.NomeEspecialidade, Medico.NomeMedico FROM Medico
INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade
WHERE IdMedico = @contagem;

EXECUTE Quantidade 1;

--RETORNA A IDADE DO PACIENTE

CREATE PROCEDURE RetornaIdade
@ID INT
AS
SELECT YEAR(GETDATE())-YEAR(DtNascimento)-IIF(MONTH(GETDATE())*32+DAY(GETDATE())<MONTH(DtNascimento)*32+DAY(DtNascimento),1,0) AS Idade
FROM Paciente
WHERE IdPaciente = @ID

EXECUTE RetornaIdade 3