SELECT ar.nome AS artista, COUNT(se.artista_id) AS seguidores, al.nome AS album
FROM SpotifyClone.artistas AS ar
JOIN SpotifyClone.seguindo_artistas AS se
ON ar.artista_id = se.artista_id
JOIN SpotifyClone.albuns AS al
ON ar.artista_id = al.artista_id
GROUP BY ar.nome, al.nome ORDER BY `seguidores` DESC, `artista`, `album`;