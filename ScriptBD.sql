
CREATE TABLE Tb_EDITORA (
                cod_editora VARCHAR(10) NOT NULL,
                telefone_1 VARCHAR(14) NOT NULL,
                telefone_2 VARCHAR(14),
                email VARCHAR(50) NOT NULL,
                nome_contato VARCHAR(50) NOT NULL,
                PRIMARY KEY (cod_editora)
);


CREATE TABLE Tb_LIVRO (
                cod_livro VARCHAR(10) NOT NULL,
                valor DECIMAL NOT NULL,
                ano_publicacao INT NOT NULL,
                categoria VARCHAR(25) NOT NULL,
                titulo VARCHAR(50) NOT NULL,
                nome_livro VARCHAR(50) NOT NULL,
                isbn INT NOT NULL,
                autor VARCHAR(25) NOT NULL,
                cod_editora VARCHAR(10) NOT NULL,
                PRIMARY KEY (cod_livro)
);


CREATE TABLE Tb_ESTOQUE (
                cod_livro VARCHAR(10) NOT NULL,
                qtd_estoque INT NOT NULL,
                PRIMARY KEY (cod_livro)
);


CREATE TABLE Tb_CLIENTE (
                cod_cliente VARCHAR(20) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                telefone_1 VARCHAR(14) NOT NULL,
                telefone_2 VARCHAR(14) NOT NULL,
                email VARCHAR(50) NOT NULL,
                rua VARCHAR(50) NOT NULL,
                bairro VARCHAR(20) NOT NULL,
                cidade VARCHAR(15) NOT NULL,
                estado VARCHAR(10) NOT NULL,
                PRIMARY KEY (cod_cliente)
);


CREATE TABLE Tb_PESSOA_JURIDICA (
                cod_cliente VARCHAR(20) NOT NULL,
                cnpj VARCHAR(20) NOT NULL,
                ie VARCHAR(20) NOT NULL,
                PRIMARY KEY (cod_cliente)
);


CREATE TABLE Tb_PESSOA_FISICA (
                cod_cliente VARCHAR(20) NOT NULL,
                cpf VARCHAR(15) NOT NULL,
                rg VARCHAR(15) NOT NULL,
                PRIMARY KEY (cod_cliente)
);


CREATE TABLE Tb_PEDIDO (
                cod_pedido VARCHAR(10) NOT NULL,
                data DATE NOT NULL,
                valor_pedido DECIMAL NOT NULL,
                cod_cliente VARCHAR(20) NOT NULL,
                PRIMARY KEY (cod_pedido)
);


CREATE TABLE Tb_PEDIDO (
                cod_pedido VARCHAR(10) NOT NULL,
                cod_livro VARCHAR(10) NOT NULL,
                qtd_pedido INT NOT NULL,
                valor_item DECIMAL NOT NULL,
                PRIMARY KEY (cod_pedido, cod_livro)
);


ALTER TABLE Tb_LIVRO ADD CONSTRAINT tb_editora_tb_livro_fk
FOREIGN KEY (cod_editora)
REFERENCES Tb_EDITORA (cod_editora)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_PEDIDO ADD CONSTRAINT tb_livro_tb_pedido_fk
FOREIGN KEY (cod_livro)
REFERENCES Tb_LIVRO (cod_livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_ESTOQUE ADD CONSTRAINT tb_livro_tb_estoque_fk
FOREIGN KEY (cod_livro)
REFERENCES Tb_LIVRO (cod_livro)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_PEDIDO ADD CONSTRAINT tb_cliente_tb_pedido_fk
FOREIGN KEY (cod_cliente)
REFERENCES Tb_CLIENTE (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_PESSOA_FISICA ADD CONSTRAINT tb_cliente_tb_pessoa_fisica_fk
FOREIGN KEY (cod_cliente)
REFERENCES Tb_CLIENTE (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_PESSOA_JURIDICA ADD CONSTRAINT tb_cliente_tb_pessoa_juridica_fk
FOREIGN KEY (cod_cliente)
REFERENCES Tb_CLIENTE (cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Tb_PEDIDO ADD CONSTRAINT tb_pedido_tb_pedido_fk
FOREIGN KEY (cod_pedido)
REFERENCES Tb_PEDIDO (cod_pedido)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
