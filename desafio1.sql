DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;


CREATE TABLE SpotifyClone.planos(
      plano_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      plano VARCHAR(30) NOT NULL,
      valor DECIMAL NOT NULL
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.usuarios(
      usuario_id INT NOT NULL AUTO_INCREMENT,
      nome VARCHAR(30) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      PRIMARY KEY(usuario_id),
      FOREIGN KEY(plano_id) REFERENCES planos(plano_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      artista_id INT NOT NULL AUTO_INCREMENT,
      nome VARCHAR(30) NOT NULL,
      PRIMARY KEY(artista_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      album_id INT NOT NULL AUTO_INCREMENT,
      artista_id INT NOT NULL,
      nome VARCHAR(30) NOT NULL,
      ano_lancamento INT NOT NULL,
      PRIMARY KEY(album_id),
      FOREIGN KEY(artista_id) REFERENCES artistas(artista_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.musicas(
      musica_id INT NOT NULL AUTO_INCREMENT,
      album_id INT NOT NULL,
      nome VARCHAR(60) NOT NULL,
      duracao INT NOT NULL,
      PRIMARY KEY(musica_id),
      FOREIGN KEY(album_id) REFERENCES albuns(album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico(
      usuario_id INT NOT NULL,
      data_reproducao DATETIME,
      musica_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(usuario_id, musica_id),
      FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
      FOREIGN KEY(musica_id) REFERENCES musicas(musica_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo_artistas(
      artista_id INT,
      usuario_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(artista_id, usuario_id),
      FOREIGN KEY(artista_id) REFERENCES artistas(artista_id),
      FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id)
  ) engine = InnoDB;


INSERT INTO SpotifyClone.planos (plano, valor)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);
    
  INSERT INTO SpotifyClone.usuarios (nome, idade, plano_id)
  VALUES
    ('Barbara Liskov', 82, 1),
    ('Robert Cecil Martin', 58, 1),
    ('Ada Lovelace', 37, 2),
    ('Martin Fowler', 46, 2),
    ('Sandi Metz', 58, 2),
    ('Paulo Freire', 19, 3),
    ('Bell Hooks', 26, 3),
    ('Christopher Alexander', 85, 4),
    ('Judith Butler', 45, 4),
    ('Jorge Amado', 58, 4);
  
  INSERT INTO SpotifyClone.artistas (nome)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

    INSERT INTO SpotifyClone.albuns (nome, ano_lancamento, artista_id)
  VALUES
    ("Renaissance", 2022, 1),
    ("Jazz", 1978, 2),
    ("Hot Space", 1982, 2),
    ("Falso Brilhante", 1998, 3),
    ("Vento de Maio", 2001, 3),
    ("QVVJFA?", 2003, 4),
    ("Somewhere Far Beyond", 2007, 5),
    ("I Put A Spell On You", 2012, 6);

    INSERT INTO SpotifyClone.seguindo_artistas (usuario_id, artista_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);

    INSERT INTO SpotifyClone.musicas(nome, album_id, duracao)
  VALUES
  ("BREAK MY SOUL", 1, 279),
  ("VIRGO'S GROOVE", 1, 369),
  ("ALIEN SUPERSTAR", 1, 116),
  ("Don't Stop Me Now", 2, 203),
  ("Under Pressure", 3, 152),
  ("Como Nossos Pais", 4, 105),
  ("O Medo de Amar é o Medo de Ser Livre", 5, 207),
  ("Samba em Paris", 6, 267),
  ("The Bard's Song", 7, 244),
  ("Feeling Good", 8, 100);

  INSERT INTO SpotifyClone.historico(usuario_id, data_reproducao, musica_id)
  VALUES
  (1, "2022-02-28 10:45:55", 8),
  (1, "2020-05-02 05:30:35", 2),
  (1, "2020-03-06 11:22:33", 10),
  (2, "2022-08-05 08:05:17", 10),
  (2, "2020-01-02 07:40:33", 7),
  (3, "2020-11-13 16:55:13", 10),
  (3, "2020-12-05 18:38:30",2),
  (4, "2021-08-15 17:10:10", 8),
  (5, "2022-01-09 01:44:33", 8),
  (5, "2020-08-06 15:23:43", 5),
  (6, "2017-01-24 00:31:17", 7),
  (6, "2017-10-12 12:35:20", 1),
  (7, "2011-12-15 22:30:49", 4),
  (8, "2012-03-17 14:56:41", 4),
  (9, "2022-02-24 21:14:22", 9),
  (10, "2015-12-13 08:30:22", 3);
  



