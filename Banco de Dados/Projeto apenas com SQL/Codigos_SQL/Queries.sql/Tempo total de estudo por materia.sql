SELECT m.materia AS Materia,
(SUM(e.tempo_de_estudo)/60/60) ||':'||
printf('%02d',SUM(e.tempo_de_estudo)/60%60) ||':'||
printf('%02d',SUM(e.tempo_de_estudo)%60) as 'Tempo total de estudo da materia'
FROM materias m
LEFT JOIN  materia_topicos mt 
ON m.materia_id = mt.materia_id
LEFT JOIN topicos t 
ON mt.topico_id = t.topico_id
LEFT JOIN estudos e 
ON t.topico_id = e.topico_estudado
GROUP BY m.materia_id;
