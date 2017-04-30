SELECT m.title, a.authorname
FROM monography AS m
JOIN monography_author AS ma
ON m.id = ma.monography_id
JOIN author AS a
ON ma.author_id = a.id
;