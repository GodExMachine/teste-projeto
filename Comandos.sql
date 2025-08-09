CREATE DATABASE projeto;

DROP DATABASE projeto;
 
USE projeto;




CREATE TABLE endereco (
    id_endereco BIGINT AUTO_INCREMENT PRIMARY KEY,
    logradouro_endereco VARCHAR(100) NOT NULL,
    numero_endereco VARCHAR(20) NOT NULL,
    complemento_endereco VARCHAR(100),
    bairro_endereco VARCHAR(100) NOT NULL,
    cidade_endereco VARCHAR(100) NOT NULL,
    estado_endereco VARCHAR(50) NOT NULL,
    cep_endereco VARCHAR(20) NOT NULL,
    UNIQUE (
        logradouro_endereco,
        numero_endereco,
        complemento_endereco,
        bairro_endereco,
        cidade_endereco,
        estado_endereco,
        cep_endereco
    )
);


CREATE TABLE usuario (
    id_usuario BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50) NOT NULL,
    sobrenome_usuario VARCHAR(45) NOT NULL,
    email_usuario VARCHAR(45) NOT NULL UNIQUE,
    senha_usuario VARCHAR(25) NOT NULL,
    id_endereco BIGINT NOT NULL,
    CONSTRAINT fk_endereco_usuario FOREIGN KEY (id_endereco)
        REFERENCES endereco(id_endereco)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);


CREATE TABLE evento (
    id_evento BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_usuario BIGINT NOT NULL,
    id_endereco BIGINT NOT NULL,
    data_evento DATE NOT NULL,
    comentario TEXT,
    CONSTRAINT fk_usuario_evento FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_endereco_evento FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco) ON DELETE CASCADE ON UPDATE CASCADE
);



SELECT * FROM usuario;
SELECT * FROM endereco;
SELECT * FROM evento;

SELECT u.*, e.*
FROM usuario u
JOIN endereco e ON u.id_endereco = e.id_endereco;




SELECT * FROM evento
WHERE id_usuario = 1;
