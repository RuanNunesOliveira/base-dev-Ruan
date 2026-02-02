SELECT u.nome AS Nome,
m.materia AS 'Ultima materia estudada pelo usuario',
MAX(e.data_do_estudo) AS Data
FROM usuarios u
LEFT JOIN estudos e
ON u.usuario_id = e.usuario_id
LEFT JOIN topicos t
ON e.topico_estudado = t.topico_id
LEFT JOIN materia_topicos mt
ON t.topico_id = mt.topico_id
LEFT JOIN materias m
ON mt.materia_id = m.materia_id
GROUP BY u.nome;