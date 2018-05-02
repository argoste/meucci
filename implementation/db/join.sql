SELECT mo.id, mo.title, au.authorname
    FROM monography as mo,
        monography_author AS au
    WHERE mo.id = au.monography_id;