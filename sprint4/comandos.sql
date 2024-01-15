--atividade 1
CREATE TABLE pedidos (
    id BIGINT PRIMARY KEY,
    produto VARCHAR(255),
    categoria VARCHAR(255),
    preco DECIMAL(10,2),
    quantidade INTEGER,
    data DATE,
    cliente VARCHAR(60)
);

--atividade 2
INSERT INTO pedido (id, categoria, produto, preco, quantidade, data, cliente)
VALUES
    (1, 'INFO', 'Notebook Samsung', 3523.00, 1, '2022-01-01', 'ANA'),
    (2, 'MÓVEIS', 'Sofá 3 lugares', 2500.00, 1, '2022-01-05', 'ANA'),
    (3, 'LIVROS', 'Clean Architecture', 102.90, 2, '2022-01-08', 'ANA'),
    (4, 'MÓVEIS', 'Mesa de jantar 6 lugares', 3678.98, 1, '2022-01-06', 'ELI'),
    (5, 'CELULARES', 'iPhone 13 Pro', 9176.00, 6, '2022-01-13', 'ANA'),
    (6, 'INFO', 'Monitor Dell 27"', 1889.00, 3, '2022-01-04', 'DANI'),
    (7, 'LIVROS', 'Implementing Domain-Driven Design', 144.07, 3, '2022-01-10', 'GABI'),
    (8, 'AUTOMOTIVA', 'Jogo de pneus', 1276.79, 1, '2022-01-15', 'BIA'),
    (9, 'LIVROS', 'Clean Code', 95.17, 1, '2022-01-09', 'BIA'),
    (10, 'CELULARES', 'Galaxy S22 Ultra', 8549.10, 5, '2022-01-14', 'DANI'),
    (11, 'INFO', 'Macbook Pro 16', 31752.00, 1, '2022-01-03', 'CAIO'),
    (12, 'LIVROS', 'Refactoring Improving the Design of Existing Code', 173.90, 1, '2022-01-12', 'DANI'),
    (13, 'MÓVEIS', 'Cama queen size', 3100.00, 2, '2022-01-07', 'DANI'),
    (14, 'AUTOMOTIVA', 'Central multimidia', 711.18, 1, '2022-01-16', 'CAIO'),
    (15, 'LIVROS', 'Building Microservices', 300.28, 2, '2022-01-11', 'CAIO'),
    (16, 'INFO', 'Galaxy Tab S8', 5939.10, 4, '2022-01-02', 'BIA');

--atividade 3
update pedidos set categoria = 'Informática' where categoria = 'INFO';

--atividade 4
select * from pedido;

--atividade 5
select * from pedido where categoria = 'celulares';
