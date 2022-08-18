SELECT COUNT(DISTINCT m.album_id) AS albuns, COUNT(DISTINCT m.nome) AS cancoes, COUNT(DISTINCT a.artista_id) AS artistas
FROM
SpotifyClone.musicas AS m
LEFT JOIN SpotifyClone.artistas AS a
ON m.album_id = a.artista_id;