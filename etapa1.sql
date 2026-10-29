CREATE DATABASE bd_cursos_livres
CHARACTER SET utf8mb4;

USE bd_cursos_livres;

CREATE TABLE aluno (
	id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    cpf char(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL
);

CREATE TABLE instrutor (
	id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL
);

CREATE TABLE cursos (
	id_curso INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    valor FLOAT(10,2) NOT NULL,
    
    CONSTRAINT ck_carga_horaria CHECK (carga_horaria > 0),
    CONSTRAINT ck_valor CHECK (valor >= 0)
);

CREATE TABLE turma (
	id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    id_instrutor INT NOT NULL,
    data_inicio DATE NOT NULL,
    vagas_maximas INT NOT NULL,
    CONSTRAINT ck_vagas CHECK (vagas_maximas > 0),
    
    CONSTRAINT fk_instrutor FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    CONSTRAINT fk_cursos FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE matriculas (
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE NOT NULL DEFAULT (CURRENT_DATE),
    situacao VARCHAR(50) NOT NULL DEFAULT "Ativa",
    
    CONSTRAINT pk_aluno_turma PRIMARY KEY (id_aluno, id_turma),
    
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
    CONSTRAINT fk_matricula_turma FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
		ON DELETE RESTRICT
        ON UPDATE CASCADE
);