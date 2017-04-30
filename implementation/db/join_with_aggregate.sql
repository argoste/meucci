SELECT m.id, m.title, string_agg(a.authorname, ', ')
-- can also use array_agg(expression)
FROM monography AS m
JOIN monography_author AS ma
ON m.id = ma.monography_id
JOIN author AS a
ON ma.author_id = a.id
GROUP BY m.id
;