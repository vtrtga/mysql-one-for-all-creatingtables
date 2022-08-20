SELECT m.nome AS cancao, COUNT(h.musica_id) AS reproducoes FROM SpotifyClone.musicas AS m
JOIN SpotifyClone.historico as h
ON h.musica_id = m.musica_id
GROUP BY cancao ORDER BY `reproducoes` DESC, cancao LIMIT 2;