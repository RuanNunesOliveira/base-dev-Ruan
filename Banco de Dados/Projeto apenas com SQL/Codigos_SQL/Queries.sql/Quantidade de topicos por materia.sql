SELECT m.materia AS Materia, COUNT(t.topico) AS 'Quantidade de topicos da materia'
FROM materias m
LEFT JOIN materia_topicos mt
ON m.materia_id = mt.materia_id
LEFT JOIN topicos t
ON mt.topico_id = t.topico_id
GROUP BY m.materia;