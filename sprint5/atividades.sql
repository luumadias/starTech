CREATE DATABASE comex;

CREATE TABLE categoria (
    id bigint AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE produto (
    id bigint AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    preco decimal(10, 2),
    categoria_id bigint,
    FOREIGN KEY(categoria_id) references categoria(id)
);

CREATE TABLE cliente (
    id bigint AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE pedido (
    id bigint AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATETIME,
    cliente_id bigint,
    FOREIGN KEY(cliente_id) REFERENCES cliente(id)
);

CREATE TABLE item_pedido (
    id bigint AUTO_INCREMENT PRIMARY KEY,
    pedido_id bigint,
    produto_id bigint,
    preco_unitario decimal(10, 2),
    quantidade integer,
    FOREIGN KEY(pedido_id) REFERENCES pedido(id),
    FOREIGN KEY(produto_id) REFERENCES produto(id)
);



SELECT
    categoria.id AS id_categoria,
    categoria.nome AS categoria,
    produto.id AS id_produto,
    produto.nome AS produto,
    produto.preco AS preco
FROM
    categoria
    INNER JOIN produto ON categoria.id = produto.categoria_id
ORDER BY
    categoria.nome,
    produto.nome;

SELECT
    cliente.nome AS cliente,
    categoria.nome AS categoria,
    produto.nome AS produto,
    produto.preco AS preco_unitario,
    item_pedido.quantidade AS quantidade,
    pedido.data_pedido AS datas
FROM
    cliente
    INNER JOIN pedido ON cliente.id = pedido.cliente_id
    INNER JOIN item_pedido ON pedido.id = item_pedido.pedido_id
    INNER JOIN produto ON item_pedido.produto_id = produto.id
    INNER JOIN categoria ON categoria.id = produto.categoria_id
ORDER BY
    cliente.nome,
    categoria.nome;

SELECT
    categoria.nome,
    sum(
        item_pedido.preco_unitario * item_pedido.quantidade
    ) AS total
from
    categoria
    INNER JOIN produto ON categoria.id = produto.categoria_id
    INNER JOIN item_pedido ON item_pedido.produto_id = produto.id
GROUP BY
    categoria.nome
ORDER BY
    sum(
        item_pedido.preco_unitario * item_pedido.quantidade
    ) DESC;



INSERT categoria(nome) VALUES ("INFO");
INSERT categoria(nome) VALUES ("MÓVEIS");
INSERT categoria(nome) VALUES ("LIVROS");
INSERT categoria(nome) VALUES ("CELULARES");
INSERT categoria(nome) VALUES ("AUTOMOTIVA");

INSERT cliente(nome) VALUES ("ANA");
INSERT cliente(nome) VALUES ("ELI");
INSERT cliente(nome) VALUES ("DANI");
INSERT cliente(nome) VALUES ("GABI");
INSERT cliente(nome) VALUES ("BIA");
INSERT cliente(nome) VALUES ("CAIO"); 

INSERT produto(nome,preco,categoria_id) VALUES ("Notebook Samsung",3523.00,1);
INSERT produto(nome,preco,categoria_id) VALUES ("Sofá 3 lugares",2500.00,2);
INSERT produto(nome,preco,categoria_id) VALUES ("Clean Architecture",102.90,3);
INSERT produto(nome,preco,categoria_id) VALUES ("Mesa de jantar 6 lugares",3678.98,2);
INSERT produto(nome,preco,categoria_id) VALUES ("iPhone 13 Pro",9176.00,4);
INSERT produto(nome,preco,categoria_id) VALUES ('Monitor Dell 27"',1889.00,1);
INSERT produto(nome,preco,categoria_id) VALUES ("Implementing Domain-Driven Design",144.07,3);
INSERT produto(nome,preco,categoria_id) VALUES ("Jogo de pneus",1276.79,5);
INSERT produto(nome,preco,categoria_id) VALUES ("Clean Code",95.17,3);
INSERT produto(nome,preco,categoria_id) VALUES ("Galaxy S22 Ultra",8549.10,4);
INSERT produto(nome,preco,categoria_id) VALUES ("Macbook Pro 16",31752.00,1);
INSERT produto(nome,preco,categoria_id) VALUES ("Refactoring Improving the Design of Existing Code",173.90,3);
INSERT produto(nome,preco,categoria_id) VALUES ("Cama queen size",3100.00,2);
INSERT produto(nome,preco,categoria_id) VALUES ("Central multimidia",711.18,5);
INSERT produto(nome,preco,categoria_id) VALUES ("Building Microservices",300.28,3);
INSERT produto(nome,preco,categoria_id) VALUES ("Galaxy Tab S8",5939.10,1);

INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-01",1);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-05",1);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-08",1);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-06",2);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-13",1);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-04",3);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-10",4);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-15",5);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-09",5);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-14",3);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-03",6);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-12",3);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-07",3);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-16",6);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-11",6);
INSERT pedido(data_pedido,cliente_id) VALUES ("2022-01-02",5);

INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (1,1,3523,1);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (2,2,2500,1);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (3,3,102.90,2);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (4,4,3678.98,1);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (5,5,9176.00,6);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (6,6,1889.00,3);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (7,7,144.07,3);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (8,8,1276.79,1);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (9,9,95.17,1);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (10,10,8549.10,5);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (11,11,31752.00,1);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (12,12,173.90,1);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (13,13,3100.00,2);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (14,14,711.18,1);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (15,15,300.28,2);
INSERT INTO item_pedido(pedido_id, produto_id,preco_unitario, quantidade) VALUES (16,16,5939.10,4);