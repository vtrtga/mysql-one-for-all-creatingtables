SELECT COUNT(hi.usuario_id) AS quantidade_musicas_no_historico FROM SpotifyClone.historico AS hi
JOIN SpotifyClone.usuarios AS us
ON us.usuario_id = hi.usuario_id
WHERE us.nome = 'Barbara Liskov';