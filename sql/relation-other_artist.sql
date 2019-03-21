SELECT gid, name, type
FROM artist
WHERE type = 3;

SELECT *
FROM artist_type;

-- With this you can obtain the members of a band
SELECT artist.gid, artist.name AS name, artist.type, relation.gid, relation.name, relation.type
FROM artist
       -- With this we obtain the gid and the name of the parent artist
       LEFT JOIN (SELECT entity0, entity1, artist_parent.gid, artist_parent.name, artist_parent.type
                  FROM l_artist_artist rel_artist
                         JOIN artist artist_parent
                              ON rel_artist.entity0 = artist_parent.id
                  WHERE artist_parent.type = 1) AS relation
                 ON artist.id = relation.entity1
WHERE artist.gid = '045a66db-5a7c-4003-b6b8-ebfad63f02ce'
  AND artist.type = 3
LIMIT 50;