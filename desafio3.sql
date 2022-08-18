SELECT u.nome AS usuario, COUNT(h.musica_id) AS qt_de_musicas_ouvidas, ROUND((SUM(m.duracao)/60),2) AS total_minutos
FROM SpotifyClone.historico AS h
INNER JOIN SpotifyClone.musicas AS m
ON h.musica_id=m.musica_id
INNER JOIN SpotifyClone.usuarios AS u
ON u.usuario_id = h.usuario_id GROUP BY h.usuario_id ORDER BY u.nome;