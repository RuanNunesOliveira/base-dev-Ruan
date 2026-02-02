SELECT u.nome as 'Usuarios que estudaram mais de 12 horas e 30 minutos',
(SUM(e.tempo_de_estudo)/60/60) ||':'||
printf('%02d',SUM(e.tempo_de_estudo)/60%60) ||':'||
printf('%02d',SUM(e.tempo_de_estudo)%60) as 'Total estudado'
FROM usuarios u
LEFT JOIN estudos e
ON u.usuario_id = e.usuario_id
GROUP BY u.nome
HAVING (SUM(e.tempo_de_estudo)/60) >= 750;