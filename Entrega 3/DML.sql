USE luma_streaming;

INSERT INTO usuario (nome, cpf, email, endereco, telefone) VALUES
('Gabriel Souza', '123.456.789-01', 'gabriel@email.com', 'Rua das Flores, 123', '44 99999-1111'),
('Maria Oliveira', '987.654.321-00', 'maria@email.com', 'Av. Central, 456', '44 98888-2222'),
('Carlos Silva', '456.789.123-44', 'carlos@email.com', 'Rua Curitiba, 789', '41 97777-3333'),
('Ana Costa', '111.222.333-44', 'ana@email.com', 'Av. Paulista, 1000', '11 96666-4444'),
('Lucas Lima', '222.333.444-55', 'lucas@email.com', 'Rua Bahia, 55', '71 95555-5555'),
('Fernanda Alves', '333.444.555-66', 'fernanda@email.com', 'Av. Amazonas, 200', '92 94444-6666'),
('Pedro Santos', '444.555.666-77', 'pedro@email.com', 'Rua Minas, 300', '31 93333-7777'),
('Juliana Rocha', '555.666.777-88', 'juliana@email.com', 'Av. Sul, 400', '51 92222-8888'),
('Rafael Mendes', '666.777.888-99', 'rafael@email.com', 'Rua Norte, 500', '81 91111-9999'),
('Camila Dias', '777.888.999-00', 'camila@email.com', 'Av. Leste, 600', '21 90000-0000');

INSERT INTO perfil (nome, tipo, id_usuario_FK) VALUES
('Gabriel Principal', 'Administrador', 1),
('Gabriel Kids', 'Infantil', 1),
('Maria Personal', 'Padrão', 2),
('Carlos Casa', 'Padrão', 3),
('Ana Filmes', 'Padrão', 4),
('Lucas Séries', 'Padrão', 5),
('Fernanda Docs', 'Padrão', 6),
('Pedro Jogos', 'Infantil', 7),
('Juliana Novelas', 'Padrão', 8),
('Rafael Animes', 'Padrão', 9);

INSERT INTO lista (nome, id_perfil_FK) VALUES ('Favoritos', 1), ('Fim de Semana', 3);

INSERT INTO dispositivo (tipo, sistema_operacional, modelo) VALUES
('SmartTV', 'Tizen', 'Samsung Crystal UHD'),
('Smartphone', 'Android', 'Google Pixel 8'),
('Computador', 'Windows 11', 'Dell Inspiron');

INSERT INTO acesso (data_hora, login, ip, localizacao, id_usuario_FK, id_dispositivo_FK) VALUES
('2026-06-21 20:00:00', 'gabriel@email.com', '192.168.1.10', 'Campo Mourão - PR', 1, 3),
('2026-06-21 20:45:00', 'carlos@email.com', '172.16.25.4', 'Curitiba - PR', 3, 1),
('2026-06-21 21:00:00', 'ana@email.com', '10.0.0.5', 'São Paulo - SP', 4, 2);

INSERT INTO assinatura (data_inicio, data_fim, status, id_usuario_FK) VALUES
('2026-01-01', NULL, 'Ativo', 1),
('2025-06-15', '2026-06-15', 'Cancelado', 2),
('2026-02-20', NULL, 'Ativo', 3),
('2026-03-10', NULL, 'Ativo', 4);

INSERT INTO plat_pagamento (nome, tipo, status) VALUES
('Stripe', 'Cartão de Crédito', 'Ativo'),
('Mercado Pago', 'Pix', 'Ativo'),
('PayPal', 'Carteira Digital', 'Ativo');

INSERT INTO pagamento (valor, data_pagamento, status, id_assinatura_FK, id_plataforma_FK) VALUES
(39.90, '2026-05-01 10:00:00', 'Concluído', 1, 1),
(54.90, '2025-05-15 14:00:00', 'Concluído', 2, 3),
(39.90, '2026-05-20 09:30:00', 'Concluído', 3, 2),
(39.90, '2026-06-01 08:00:00', 'Concluído', 4, 1);

INSERT INTO classificacao (faixa_etaria) VALUES ('Livre'), ('10 anos'), ('12 anos'), ('14 anos'), ('16 anos'), ('18 anos');

INSERT INTO midia (titulo, sinopse, data_lancamento, id_classificacao_FK) VALUES
('Interestelar', 'Viagem através de um buraco de minhoca.', '2014-11-06', 3),
('Mad Max: Estrada da Fúria', 'Fuga em um mundo pós-apocalíptico.', '2015-05-14', 5),
('Stranger Things', 'Jovens descobrem segredos sobrenaturais.', '2016-07-15', 4),
('Breaking Bad', 'Professor de química entra para o crime.', '2008-01-20', 6),
('O Poderoso Chefão', 'A saga da família mafiosa Corleone.', '1972-03-24', 6),
('Matrix', 'Um hacker descobre a verdadeira natureza da realidade.', '1999-03-31', 4),
('Vingadores: Ultimato', 'Os heróis tentam reverter o estalo de Thanos.', '2019-04-25', 3),
('The Office', 'O dia a dia cômico de uma empresa de papel.', '2005-03-24', 3),
('Game of Thrones', 'Famílias nobres lutam pelo controle de Westeros.', '2011-04-17', 6),
('Dark', 'O desaparecimento de crianças revela segredos de viagem no tempo.', '2017-12-01', 5);

INSERT INTO filme (id_midia_FK, duracao_total, diretor, oscar_vencidos) VALUES
(1, 169, 'Christopher Nolan', 1),
(2, 120, 'George Miller', 6),
(5, 175, 'Francis Ford Coppola', 3),
(6, 136, 'Asas Wachowski', 4),
(7, 181, 'Anthony Russo', 0);

INSERT INTO serie (id_midia_FK, data_inicio, data_fim) VALUES
(3, '2016-07-15', NULL),
(4, '2008-01-20', '2013-09-29'),
(8, '2005-03-24', '2013-05-16'),
(9, '2011-04-17', '2019-05-19'),
(10, '2017-12-01', '2020-06-27');

INSERT INTO categoria (nome, descricao) VALUES
('Ficção Científica', 'Especulações científicas e espaço'),
('Ação', 'Ritmo acelerado e perseguições'),
('Drama', 'Conflitos emocionais densos'),
('Comédia', 'Conteúdo voltado ao humor');

INSERT INTO midia_categoria (id_midia_FK, id_categoria_FK) VALUES
(1, 1), (2, 2), (3, 1), (4, 3), (5, 3), (6, 1), (7, 2), (8, 4), (9, 3), (10, 1);

INSERT INTO avaliacao (nota, comentario, data_avaliacao, id_perfil_FK, id_midia_FK) VALUES
(5, 'Obra prima do Nolan.', '2026-02-15 18:30:00', 1, 1),
(4, 'Ótimo ritmo de ação.', '2026-04-10 21:00:00', 3, 2),
(5, 'A melhor série de ficção da atualidade.', '2026-05-01 10:00:00', 4, 3),
(5, 'Atuação impecável, execusão divina.', '2026-05-05 12:00:00', 5, 4),
(5, 'Desde que esse filme se tornou modinha muitos posers dizem que gostam.', '2026-05-10 14:00:00', 6, 5),
(4, 'Da pra melhorar.', '2026-05-15 16:00:00', 7, 6),
(5, 'Épico do início ao fim, perfeito, inagualável.', '2026-05-20 18:00:00', 8, 7),
(4, 'Muito engraçado.', '2026-05-25 20:00:00', 9, 8),
(1, 'Mediocre que filme de merda.', '2026-06-01 22:00:00', 10, 9),
(4, 'Complexo e fascinante.', '2026-06-10 23:00:00', 1, 10);

INSERT INTO hist_visualizacao (data_visualizacao, progresso, id_perfil_FK, id_midia_FK, id_episodio_FK) VALUES
('2026-06-21 21:00:00', 95.50, 1, 1, NULL),
('2026-06-20 19:30:00', 100.00, 3, 2, NULL),
('2026-06-19 18:00:00', 45.00, 4, 3, NULL),
('2026-06-18 20:15:00', 92.00, 5, 4, NULL),
('2026-06-17 22:30:00', 10.50, 6, 5, NULL),
('2026-06-16 14:00:00', 100.00, 7, 6, NULL),
('2026-06-15 16:45:00', 98.00, 8, 7, NULL),
('2026-06-14 11:20:00', 100.00, 9, 8, NULL),
('2026-06-13 09:10:00', 85.00, 10, 9, NULL),
('2026-06-12 23:50:00', 50.00, 1, 10, NULL);