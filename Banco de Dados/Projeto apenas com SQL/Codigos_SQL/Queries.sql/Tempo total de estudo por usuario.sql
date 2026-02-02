SELECT u.nome AS Nome,
(SUM(tempo_de_estudo)/60/60) ||':'||
printf('%02d', SUM(tempo_de_estudo)/60%60) ||':'||
printf('%02d', SUM(tempo_de_estudo)%60) as 'Tempo total de estudo do usuario'
FROM usuarios u
LEFT JOIN estudos e
ON e.usuario_id = u.usuario_id
GROUP BY u.nome;