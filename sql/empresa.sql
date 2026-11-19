DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa CHARACTER SET utf8 COLLATE utf8_danish_ci;
USE empresa;

-- DROP TABLES
DROP TABLE IF EXISTS movimentacao CASCADE;
DROP TABLE IF EXISTS produto CASCADE;
DROP TABLE IF EXISTS `user` CASCADE;

CREATE TABLE `user` (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    perfil ENUM('OPERADOR', 'ADMINISTRADOR') NOT NULL,
    ativo TINYINT(1) DEFAULT 1,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade_estoque INTEGER NOT NULL,
    valor_unitario NUMERIC(10,2) NOT NULL,
    data_cadastro DATE NOT NULL DEFAULT (CURRENT_DATE)
) ENGINE=InnoDB;

CREATE TABLE movimentacao (
    id_movimentacao INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL CHECK (tipo IN ('ENTRADA', 'SAIDA')),
    quantidade INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    datetime_movimentacao DATETIME,
    id_user INTEGER NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_user) REFERENCES `user`(id_user)
) ENGINE=InnoDB;

INSERT INTO user (nome, email, senha, perfil, ativo) VALUES
('Administrador', 'adm@email.com', '$2y$10$DfF/CCXmW9qUh9rvtSyHp.vc5xmzy9ZpOQXI7CFPyA7iMXJHg4PB6', 'ADMINISTRADOR', 1),
('João Oliveira', 'joao@email.com', '$2y$10$epU9Cq.IzkeI2gNEKrmHBu3bLS31LBM/XjQNNuHPMXuGtqVncZQPi', 'OPERADOR', 1);

INSERT INTO produto (nome, quantidade_estoque, valor_unitario) VALUES
('Amaciante de roupas', 100, 0.50),
('Detergente', 25, 18.90),
('Sabão em pó', 40, 22.50);


INSERT INTO movimentacao (tipo, quantidade, id_produto, datetime_movimentacao, id_user) VALUES
('ENTRADA', 50, 1, NOW(), 1),
('SAIDA', 10, 1, NOW(), 1),
('SAIDA', 5, 2, NOW(), 1);