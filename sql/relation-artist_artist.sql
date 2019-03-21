-- See kind of relations between artists
SELECT id, parent, entity_type0, entity_type1, name
FROM link_type
WHERE entity_type0 = 'artist'
  AND entity_type1 = 'artist'
  AND parent ISNULL
ORDER BY entity_type0 ASC, entity_type1 ASC;

-- See kind of musical relations between artists
SELECT id, parent, entity_type0, entity_type1, name
FROM link_type
WHERE parent = 106
ORDER BY name ASC;

-- Queries to extract the information about artist as a person
SELECT artist.gid,
       artist.name AS name,
       artist.type
FROM artist
WHERE artist.type = 1 AND gid=
LIMIT 50;

-- Queries to extract the information about artist as a person
SELECT artist.gid,
       artist.name AS name,
       artist.type,
       relation.gid,
       relation.name
FROM artist
       -- With this we obtain the gid and the name of the parent artist
       LEFT JOIN (SELECT entity0,
                         entity1,
                         link,
                         artist_parent.gid,
                         artist_parent.name
                  FROM l_artist_artist rel_artist
                         JOIN artist artist_parent
                              ON rel_artist.entity0 = artist_parent.id) AS relation
                 ON artist.id = relation.entity1
WHERE artist.type = 1
LIMIT 50;