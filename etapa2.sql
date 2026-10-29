USE bd_cursos_livres;

ALTER TABLE aluno
ADD COLUMN telefone VARCHAR(20);

ALTER TABLE aluno
MODIFY COLUMN telefone VARCHAR(25);

ALTER TABLE aluno
RENAME COLUMN telefone TO telefone_contato;

ALTER TABLE cursos
ADD COLUMN descricao TEXT;

ALTER TABLE cursos
ADD COLUMN modalidade VARCHAR(100) DEFAULT "Presencial";

ALTER TABLE cursos
ADD CONSTRAINT ck_modalidade CHECK (modalidade IN ("Presencial, Online ou hibrido"));

ALTER TABLE turmas
ADD COLUMN observacao VARCHAR(100),
DROP COLUMN observacao;

ALTER TABLE instrutor
RENAME TO professor;

SHOW TABLES;

DESCRIBE aluno;
DESCRIBE cursos;
DESCRIBE professor;
DESCRIBE turma;
DESCRIBE matricula;