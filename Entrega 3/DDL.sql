CREATE DATABASE luma_streaming;
USE luma_streaming;

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE perfil (
    id_perfil INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    id_usuario_FK INT NOT NULL,
    FOREIGN KEY (id_usuario_FK) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);

CREATE TABLE lista (
    id_lista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_perfil_FK INT NOT NULL,
    FOREIGN KEY (id_perfil_FK) REFERENCES perfil(id_perfil) ON DELETE CASCADE
);

CREATE TABLE dispositivo (
    id_dispositivo INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    sistema_operacional VARCHAR(100),
    modelo VARCHAR(100)
);

CREATE TABLE acesso (
    id_acesso INT PRIMARY KEY AUTO_INCREMENT,
    data_hora DATETIME NOT NULL,
    login VARCHAR(150),
    ip VARCHAR(50),
    localizacao VARCHAR(255),
    id_usuario_FK INT NOT NULL,
    id_dispositivo_FK INT NOT NULL,
    FOREIGN KEY (id_usuario_FK) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_dispositivo_FK) REFERENCES dispositivo(id_dispositivo)
);

CREATE TABLE assinatura (
    id_assinatura INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    status VARCHAR(30),
    id_usuario_FK INT NOT NULL,
    FOREIGN KEY (id_usuario_FK) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);

CREATE TABLE plat_pagamento (
    id_plataforma INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    status VARCHAR(30)
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    status VARCHAR(30),
    id_assinatura_FK INT NOT NULL,
    id_plataforma_FK INT NOT NULL,
    FOREIGN KEY (id_assinatura_FK) REFERENCES assinatura(id_assinatura) ON DELETE CASCADE,
    FOREIGN KEY (id_plataforma_FK) REFERENCES plat_pagamento(id_plataforma)
);

CREATE TABLE classificacao (
    id_classificacao INT PRIMARY KEY AUTO_INCREMENT,
    faixa_etaria VARCHAR(20) NOT NULL
);

CREATE TABLE midia (
    id_midia INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    sinopse TEXT,
    data_lancamento DATE,
    id_classificacao_FK INT,
    FOREIGN KEY (id_classificacao_FK) REFERENCES classificacao(id_classificacao)
);

CREATE TABLE filme (
    id_midia_FK INT PRIMARY KEY,
    duracao_total INT,
    diretor VARCHAR(150),
    oscar_vencidos INT DEFAULT 0,
    FOREIGN KEY (id_midia_FK) REFERENCES midia(id_midia) ON DELETE CASCADE
);

CREATE TABLE serie (
    id_midia_FK INT PRIMARY KEY,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (id_midia_FK) REFERENCES midia(id_midia) ON DELETE CASCADE
);

CREATE TABLE temporada (
    id_temporada INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    descricao TEXT,
    id_serie_FK INT NOT NULL,
    FOREIGN KEY (id_serie_FK) REFERENCES serie(id_midia_FK) ON DELETE CASCADE
);

CREATE TABLE episodio (
    id_episodio INT PRIMARY KEY AUTO_INCREMENT,
    numero_episodio INT NOT NULL,
    id_temporada_FK INT NOT NULL,
    FOREIGN KEY (id_temporada_FK) REFERENCES temporada(id_temporada) ON DELETE CASCADE
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE midia_categoria (
    id_midia_FK INT NOT NULL,
    id_categoria_FK INT NOT NULL,
    PRIMARY KEY (id_midia_FK, id_categoria_FK),
    FOREIGN KEY (id_midia_FK) REFERENCES midia(id_midia) ON DELETE CASCADE,
    FOREIGN KEY (id_categoria_FK) REFERENCES categoria(id_categoria) ON DELETE CASCADE
);

CREATE TABLE audio (
    id_audio INT PRIMARY KEY AUTO_INCREMENT,
    idioma VARCHAR(50),
    formato VARCHAR(50),
    id_midia_FK INT NULL,
    id_episodio_FK INT NULL,
    FOREIGN KEY (id_midia_FK) REFERENCES midia(id_midia) ON DELETE CASCADE,
    FOREIGN KEY (id_episodio_FK) REFERENCES episodio(id_episodio) ON DELETE CASCADE
);

CREATE TABLE legenda (
    id_legenda INT PRIMARY KEY AUTO_INCREMENT,
    idioma VARCHAR(50),
    formato VARCHAR(50),
    id_midia_FK INT NULL,
    id_episodio_FK INT NULL,
    FOREIGN KEY (id_midia_FK) REFERENCES midia(id_midia) ON DELETE CASCADE,
    FOREIGN KEY (id_episodio_FK) REFERENCES episodio(id_episodio) ON DELETE CASCADE
);

CREATE TABLE avaliacao (
    id_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao DATETIME,
    id_perfil_FK INT NOT NULL,
    id_midia_FK INT NOT NULL,
    FOREIGN KEY (id_perfil_FK) REFERENCES perfil(id_perfil) ON DELETE CASCADE,
    FOREIGN KEY (id_midia_FK) REFERENCES midia(id_midia) ON DELETE CASCADE
);

CREATE TABLE recomendacao (
    id_recomendacao INT PRIMARY KEY AUTO_INCREMENT,
    algoritmo VARCHAR(100),
    data_geracao DATETIME,
    id_perfil_FK INT NOT NULL,
    id_midia_FK INT NOT NULL,
    FOREIGN KEY (id_perfil_FK) REFERENCES perfil(id_perfil) ON DELETE CASCADE,
    FOREIGN KEY (id_midia_FK) REFERENCES midia(id_midia) ON DELETE CASCADE
);

CREATE TABLE hist_visualizacao (
    id_hist INT PRIMARY KEY AUTO_INCREMENT,
    data_visualizacao DATETIME,
    progresso DECIMAL(5,2),
    id_perfil_FK INT NOT NULL,
    id_midia_FK INT NOT NULL,
    id_episodio_FK INT NULL,
    FOREIGN KEY (id_perfil_FK) REFERENCES perfil(id_perfil) ON DELETE CASCADE,
    FOREIGN KEY (id_midia_FK) REFERENCES midia(id_midia) ON DELETE CASCADE,
    FOREIGN KEY (id_episodio_FK) REFERENCES episodio(id_episodio) ON DELETE CASCADE
);
