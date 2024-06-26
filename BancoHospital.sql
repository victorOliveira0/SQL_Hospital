CREATE SCHEMA HOSPITAL;
USE HOSPITAL;

CREATE TABLE DDD(
	codDDD INT PRIMARY KEY,
    regiaoDDD VARCHAR(45) NOT NULL
);

CREATE TABLE TELEFONE(
	codTelefone INT PRIMARY KEY,
    numTelefone VARCHAR(20) not null,
	codDDD INT NOT NULL,
	cpfPaciente INT NOT NULL,
	crmMedico INT NOT NULL,
    CONSTRAINT DDDTELEFONE
		FOREIGN KEY (codDDD) REFERENCES DDD (codDDD)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT TELEFONE_PACIENTE
		FOREIGN KEY (cpfPaciente) REFERENCES FUNCIONARIO (cpfPaciente),
	CONSTRAINT TELEFONE_MEDICO
    	FOREIGN KEY (crmMedico) REFERENCES FORNECEDOR (crmMedico)
);

CREATE TABLE MEDICO (
	crmMedico INT PRIMARY KEY,
    nomeMedico VARCHAR(45) NOT NULL,
    emailMedico VARCHAR(45) NOT NULL
);

CREATE TABLE PACIENTE (
	cpfPaciente VARCHAR(14) PRIMARY KEY,
    nomePaciente VARCHAR(45) NOT NULL,
    plano_de_saudePaciente VARCHAR(45) NOT NULL
);

CREATE TABLE ENDERECO (
	codigoEndereco INT PRIMARY KEY,
    ruaEndereco VARCHAR(45) NOT NULL,
    num_casaEndereco INT NOT NULL,
    bairroEndereco VARCHAR(45) NOT NULL,
    cidadeEndereco VARCHAR(45) NOT NULL,
    cepEndereco VARCHAR(45) NOT NULL,
    cpfPaciente VARCHAR(45) NOT NULL,
    CONSTRAINT ENDERECO_PACIENTE
		FOREIGN KEY (cpfPaciente) REFERENCES PACIENTE (cpfPaciente)
);

CREATE TABLE CONSULTA (
	tipoConsulta VARCHAR(45) PRIMARY KEY,
    dataConsulta DATETIME NOT NULL,
    crmMedico INT NOT NULL,
    cpfPaciente VARCHAR(14) NOT NULL,
    CONSTRAINT CONSULTA_MEDICO 
		FOREIGN KEY (crmMedico) REFERENCES MEDICO (crmMedico),
	CONSTRAINT CONSULTA_PACIENTE
		FOREIGN KEY (cpfPaciente) REFERENCES PACIENTE (cpfPaciente)
);

CREATE TABLE MEDICAMENTO (
	codigoMedicamento INT PRIMARY KEY,
    nomeMedicamento VARCHAR(45) NOT NULL,
    tipoMedicamento VARCHAR(45) NOT NULL,
    dosagemMedicamento VARCHAR(45) NOT NULL,
    modo_de_usoMedicamento VARCHAR(45) NOT NULL,
    tipoConsulta VARCHAR(45) NOT NULL,
    crmMedico INT NOT NULL,
    cpfPaciente VARCHAR(14) NOT NULL,
	CONSTRAINT MEDICAMENTO_TIPOCONSULTA
		FOREIGN KEY (tipoConsulta) REFERENCES CONSULTA (tipoConsulta),
    CONSTRAINT MEDICAMENTO_MEDICO
		FOREIGN KEY (crmMedico) REFERENCES MEDICO (crmMedico),
    CONSTRAINT MEDICAMENTO_PACIENTE
		FOREIGN KEY (cpfPaciente) REFERENCES PACIENTE (cpfPaciente)
);

CREATE TABLE EXAME (
	codigoExame INT PRIMARY KEY,
    nomeExame VARCHAR(45) NOT NULL,
    observacaoExame VARCHAR(45) NOT NULL,
    resultadoExame VARCHAR(45) NOT NULL,
    tipoConsulta VARCHAR(45),
    crmMedico INT,
    cpfPaciente VARCHAR(14),
    CONSTRAINT EXAME_TIPOCONSULTA
		FOREIGN KEY (tipoConsulta) REFERENCES CONSULTA (tipoConsulta),
    CONSTRAINT EXAME_MEDICO
		FOREIGN KEY (crmMedico) REFERENCES MEDICO (crmMedico),
    CONSTRAINT EXAME_PACIENTE
		FOREIGN KEY (cpfPaciente) REFERENCES PACIENTE (cpfPaciente)
);

DROP TABLE DDD;
DROP TABLE TELEFONE;
DROP TABLE MEDICO;
DROP TABLE PACIENTE;
DROP TABLE ENDERECO;
DROP TABLE CONSULTA;
DROP TABLE MEDICAMENTO;
DROP TABLE EXAME;
