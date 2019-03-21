-- Pablo from La Raíz, the singer
SELECT *
FROM artist
WHERE gid = 'c6af2e36-a84f-42b5-a7b3-ce6619fdd8fa';

-- La Raíz, spanish group
SELECT *
FROM artist
WHERE gid = '7f545ad3-e9d9-4dcb-9ec3-1a767b567ad7';

-- blink-182
SELECT *
FROM artist
WHERE gid = '0743b15a-3c32-48c8-ad58-cb325350befa';

-- AC/DC
SELECT *
FROM artist
WHERE gid = '66c662b6-6e2f-4930-8610-912e24c63ed1';

-- Bob Dylan
SELECT *
FROM artist
WHERE id = 17;

-- Artist in entity0
SELECT artist.gid, artist.name AS name, artist.type, relation.gid, relation.name, relation.type
FROM artist
       -- With this we obtain the gid and the name of the parent artist
       LEFT JOIN (SELECT entity0, entity1, artist_parent.gid, artist_parent.name, artist_parent.type
                  FROM l_artist_artist rel_artist
                         JOIN artist artist_parent
                              ON rel_artist.entity1 = artist_parent.id) AS relation
                 ON artist.id = relation.entity0
WHERE artist.type = 1
  AND artist.id = 191
LIMIT 50;

-- With this you can obtain the members of a band
SELECT artist.gid,
       artist.name AS name,
       artist.type,
       relation.gid,
       relation.name,
       relation.type,
       relation.link_type
FROM artist
       -- With this we obtain the gid and the name of the parent artist
       LEFT JOIN (SELECT entity0,
                         entity1,
                         link_info.link_type,
                         artist_parent.gid,
                         artist_parent.name,
                         artist_parent.type
                  FROM l_artist_artist rel_artist
                         LEFT JOIN artist artist_parent
                                   ON rel_artist.entity0 = artist_parent.id
                         LEFT JOIN link link_info
                                   ON rel_artist.link = link_info.id
                         LEFT JOIN link_type type_of_link
                                   ON link_info.link_type = type_of_link.id
                  WHERE type_of_link.parent = 106) AS relation
                 ON artist.id = relation.entity1
WHERE artist.gid = '66c662b6-6e2f-4930-8610-912e24c63ed1'
LIMIT 50;

SELECT *
FROM link_type
WHERE parent IS NULL;


SELECT *
FROM link_type
WHERE id = 106;