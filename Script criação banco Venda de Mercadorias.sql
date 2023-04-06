
-- -----------------------------------------------------
-- Table fornecedor
-- -----------------------------------------------------
CREATE TABLE fornecedor (
  id SERIAL NOT NULL,
  nome VARCHAR(150) NULL,
  email VARCHAR(45) NULL,
  telefone VARCHAR(45) NULL,
  cnpj VARCHAR(45) NULL,
  PRIMARY KEY (id)
  );


-- -----------------------------------------------------
-- Table compra
-- -----------------------------------------------------
CREATE TABLE compra (
  id SERIAL NOT NULL,
  data VARCHAR(45) NULL,
  fornecedor_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_compra_fornecedor
    FOREIGN KEY (fornecedor_id)
    REFERENCES fornecedor (id)
);


-- -----------------------------------------------------
-- Table produto
-- -----------------------------------------------------
CREATE TABLE produto (
  id SERIAL NOT NULL,
  descricao VARCHAR(150) NULL,
  valor_unitario DECIMAL(10,2) NULL,
  qtde_estoque DECIMAL(3,2) NULL,
  PRIMARY KEY (id)
  );


-- -----------------------------------------------------
-- Table item_compra
-- -----------------------------------------------------
CREATE TABLE item_compra (
  id SERIAL NOT NULL,
  compra_id INT NOT NULL,
  produto_id INT NOT NULL,
  qtde DECIMAL(3,2) NULL,
  valor DECIMAL(10,2) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_item_compra_compra
    FOREIGN KEY (compra_id)
    REFERENCES compra (id),
  CONSTRAINT fk_item_compra_produto
    FOREIGN KEY (produto_id)
    REFERENCES produto (id)
);


-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
CREATE TABLE cliente (
  id SERIAL NOT NULL,
  nome VARCHAR(150) NULL,
  email VARCHAR(45) NULL,
  cpf VARCHAR(45) NULL,
  telefone VARCHAR(45) NULL,
  PRIMARY KEY (id)
  );


-- -----------------------------------------------------
-- Table endereco
-- -----------------------------------------------------
CREATE TABLE endereco (
  id SERIAL NOT NULL,
  descricao VARCHAR(45) NULL,
  cep VARCHAR(10) NULL,
  PRIMARY KEY (id)
  );


-- -----------------------------------------------------
-- Table cliente_endereco
-- -----------------------------------------------------
CREATE TABLE cliente_endereco (
  id SERIAL NOT NULL,
  cliente_id INT NOT NULL,
  endereco_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cliente_endereco_cliente
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (id),
  CONSTRAINT fk_cliente_endereco_endereco
    FOREIGN KEY (endereco_id)
    REFERENCES endereco (id)
    );


-- -----------------------------------------------------
-- Table pedido
-- -----------------------------------------------------
CREATE TABLE pedido (
  id SERIAL NOT NULL,
  date DATE NULL,
  endereco_entrega VARCHAR(45) NULL,
  observacao VARCHAR(500) NULL,
  cliente_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_pedido_cliente
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (id)
    );


-- -----------------------------------------------------
-- Table item_pedido
-- -----------------------------------------------------
CREATE TABLE item_pedido (
  id SERIAL NOT NULL,
  produto_id INT NOT NULL,
  pedido_id INT NOT NULL,
  qtde DECIMAL(3,2) NULL,
  valor_item DECIMAL(10,2) NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_item_pedido_pedido
    FOREIGN KEY (pedido_id)
    REFERENCES pedido (id),
  CONSTRAINT fk_item_pedido_produto
    FOREIGN KEY (produto_id)
    REFERENCES produto (id)
    );
    
-- -----------------------------------------------------
-- Table usuario
-- -----------------------------------------------------
CREATE TABLE usuario (
  id serial NOT NULL,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(100) NOT NULL,
  situacao VARCHAR(1) NOT NULL
);

insert into usuario values(default, 'Renan', 'renan@gmail.com', '289160db0d9f39f9ae1754c4ec9c16f90b50e32e09c5fb5481ae642b3d3d1a36', 'a'); 
-- senha 'teste123' com SHA-256



-- Alterar campo qtde_estoque para tipo decimal
ALTER TABLE produto
ALTER COLUMN qtde_estoque TYPE decimal (10,2) USING qtde_estoque::decimal(10,2); 

ALTER TABLE item_pedido
ALTER COLUMN qtde TYPE decimal (10,2) USING qtde::decimal(10,2); 

ALTER TABLE item_compra
ALTER COLUMN qtde TYPE decimal (10,2) USING qtde::decimal(10,2); 





