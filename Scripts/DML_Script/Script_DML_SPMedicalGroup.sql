--DML

USE MedicalGroup_Manhã; 
Go

INSERT INTO Clinica(NomeClinica,HoraAbertura,HoraFechamento,IdEndereco)
VALUES('SP Medical Group', '04:00:00', '01:00:00',1)

INSERT INTO Usuario(IdTipoUsuario,Email,Senha)
VALUES	(3, 'joao@gmail.com','joaoroberto132')
	   ,(2,'ricardo@gmail.com','ricardo132')
	   ,(3,'ligia@gmail.com','ligia132')
	   ,(2,'adriana@gmail.com','adriana132');


INSERT INTO TipoUsuario(NomeTipoUsuario)
VALUES('Administrador'),('Médico'),('Paciente');

INSERT INTO Medico(NomeMedico,CRM,CNPJ,RazaoSocial,IdEspecialidade,IdUsuario,IdGenero)
VALUES		('Ricardo Lemos','54356-SP','86.400.902/0001-30','SP Medical Group',1,2,2),
			('Roberto Possarle','53452-SP','86.400.902/0001-35','SP Medical Group',2,5,2),
			('Adriana Santos','65463-SP','86.400.902/0001-39','SP Medical Group',3,4,1);

INSERT INTO Paciente(NomePaciente,DtNascimento,Telefone,CPF,RG,IdEndereco,IdGenero,IdUsuario)
VALUES		('João','27/08/1975','11 7656-6377','91305348010','2544444-1',3,2,3),
			('Ligia','13/10/1983','11 3456-7654','94839859000','3522543-5',2,1,3);

INSERT INTO Genero(NomeGenero)
VALUES('Feminino'),('Masculino'),('Agênero'),('Androgeno');
select *from Clinica

INSERT INTO Especialidade(NomeEspecialidade)
VALUES		 ('Acupuntura')
			,('Anestesiologia')
			,('Angiologia')
			,('Cardiologia')
			,('Cirurgia Cardiovascular')
			,('Cirurgia da Mão')
			,('Cirurgia do Aparelho Digestivo')
			,('Cirurgia Geral')
			,('Cirurgia Pediátrica')
			,('Cirurgia Plástica')
			,('Cirurgia Torácica')
			,('Cirurgia Vascular')
			,('Radioterapia')
			,('Urologia')
			,('Pediatria')
			,('Psiquiatria');
			

INSERT INTO Endereco(Logradouro,Bairro,CEP,NCasa,Complemento,Estado,Cidade)
VALUES('Rua Estado de Israel','Jd. Barbara','04022-000','539','Casa','SP','São Paulo'),
('R. Alameda Barão de Limeira','Santa Cecília', '01202-001','539','Escola','SP','São Paulo'),
('R. Ver. Geraldo de Camargo','Santa Luzia','09405-380','66','Casa','SP','São Paulo');


INSERT INTO Consulta(DtConsulta,IdStatusAndamento,IdMedico,IdPaciente)
VALUES('13/10/2020',1,1,3),('23/07/2020',3,2,2);


INSERT INTO StatusAndamento(NomeStatusAndamento)
VALUES('Agendada'),('Cancelada'),('Finalizada');


