USE luma_streaming;

SELECT m.titulo, a.nota, a.comentario
FROM midia m
JOIN avaliacao a ON m.id_midia = a.id_midia_FK
WHERE a.nota > (
    SELECT AVG(nota) 
    FROM avaliacao
);

SELECT m.titulo AS nome_obra, 'Filme Premiado' AS categoria
FROM midia m
JOIN filme f ON m.id_midia = f.id_midia_FK
WHERE f.oscar_vencidos > 0

UNION

SELECT m.titulo AS nome_obra, 'Série em Andamento' AS categoria
FROM midia m
JOIN serie s ON m.id_midia = s.id_midia_FK
WHERE s.data_fim IS NULL;

SELECT u.nome, u.email
FROM usuario u
JOIN assinatura s ON u.id_usuario = s.id_usuario_FK
WHERE s.status = 'Ativo'
  AND NOT EXISTS (
      SELECT 1 
      FROM acesso ac
      JOIN dispositivo d ON ac.id_dispositivo_FK = d.id_dispositivo
      WHERE ac.id_usuario_FK = u.id_usuario 
        AND d.tipo = 'SmartTV'
  );

SELECT m.titulo, m.sinopse
FROM midia m
JOIN midia_categoria mc ON m.id_midia = mc.id_midia_FK
WHERE mc.id_categoria_FK IN (
    SELECT id_categoria 
    FROM categoria 
    WHERE nome LIKE '%Ficção%'
);

SELECT pp.nome AS plataforma, SUM(pag.valor) AS faturamento_total
FROM plat_pagamento pp
JOIN pagamento pag ON pp.id_plataforma = pag.id_plataforma_FK
WHERE pag.status = 'Concluído'
GROUP BY pp.id_plataforma, pp.nome
HAVING SUM(pag.valor) > (
    SELECT AVG(sub_total) FROM (
        SELECT SUM(valor) AS sub_total 
        FROM pagamento 
        WHERE status = 'Concluído'
        GROUP BY id_plataforma_FK
    ) AS media_faturamento
);

SELECT p.nome AS perfil, m.titulo AS conteudo_assistido, h.progresso
FROM hist_visualizacao h
JOIN perfil p ON h.id_perfil_FK = p.id_perfil
JOIN midia m ON h.id_midia_FK = m.id_midia
WHERE h.progresso > (
    SELECT 90.00
);