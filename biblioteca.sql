--Criação do Banco de Dados.
CREATE DATABASE IF NOT EXISTS biblioteca;
    USE biblioteca;

--Tabelas da Biblioteca.

CREATE TABLE autores (
    autor_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    nascimento DATE
);

CREATE TABLE editoras (
    editora_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL
);

CREATE TABLE livros (
    livro_id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    titulo VARCHAR(150) NOT NULL, 
    ano_publicacao INTEGER,
    autor_id INTEGER, 
    editora_id INTEGER,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id),
    FOREIGN KEY (editora_id) REFERENCES editoras(editora_id)
);

--Dados da Biblioteca.

INSERT INTO autores (nome, nascimento) VALUES
    ('Stephen King','1947/09/21'),
    ('Lewis Carroll','1832/01/27'),
    ('Rebecca Yarros','1981/04/13'),
    ('Howard Philips Lovecraft','1890/08/20')
;

INSERT INTO editoras (nome) VALUES
    ('Suma'),
    ('Darkside Books - Fábulas Dark'),
    ('Planeta Minotauro'),
    ('Editora JBC')
;

INSERT INTO livros (titulo, ano_publicacao, autor_id, editora_id) VALUES
    ('O iluminado: Coleção Biblioteca Stephen King','2017','1','1'),
    ('It: A coisa','2014','1','1'),
    ('Alice no País das Maravilhas (Classic Edition)','2019','2','2'),
    ('Alice Através do Espelho (Classic Edition)','2021','2','2'),
    ('Quarta asa: 1','2024','3','3'),
    ('Chama de Ferro: 2','2024','3','3'),
    ('Tempestade de Ônix: 3','2025','3','3'),
    ('O Habitante da Escuridão','2025','4','4'),
    ('A cor que caiu do espaço','2025','4','4')
;

--Consultas.

--Consulta para a tabela completa, apresentando todos os dados cadastrados em ordem decrescente por ano de publicação dos livros.
SELECT
    livros.livro_id,
    livros.titulo,
    livros.ano_publicacao,
    autores.nome AS autor,
    autores.nascimento AS nascimento,
    editoras.nome AS editora
FROM livros
JOIN autores ON livros.autor_id = autores.autor_id
JOIN editoras ON livros.editora_id = editoras.editora_id
ORDER BY livros.ano_publicacao DESC
;

--Consulta para a tabela completa, apresentando todos os dados cadastrados dos livros publicados a partir de 2020.
SELECT
    livros.livro_id,
    livros.titulo,
    livros.ano_publicacao,
    autores.nome AS autor,
    autores.nascimento AS nascimento,
    editoras.nome AS editora
FROM livros
JOIN autores ON livros.autor_id = autores.autor_id
JOIN editoras ON livros.editora_id = editoras.editora_id
WHERE livros.ano_publicacao >= 2020
;

--Consulta para a tabela, apresentando a ID do livro, titulo e ano de publicação dos livros publicados após 2020.
SELECT
    livros.livro_id,
    livros.titulo,
    livros.ano_publicacao
FROM livros
WHERE livros.ano_publicacao > 2020
;

--Consulta para a tabela, apresentando a ID do livro, titulo, ano de publicação, ID do autor e ID da editora dos livros publicados após 2020.
SELECT * FROM livros WHERE livros.ano_publicacao > 2020;

