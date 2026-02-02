SELECT u.nome AS Nome, printf('%.2f', AVG(p.resultado)) AS "Media do usuario"
FROM usuarios u
LEFT JOIN provas p
ON u.usuario_id = p.usuario_id
GROUP BY u.nome;