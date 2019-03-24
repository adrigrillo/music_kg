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
SELECT artist.gid    AS member_gid,
       artist.name   AS member_name,
       relation.gid  AS band_gid,
       relation.name AS band_name,
       relation.link_type
FROM artist
       -- With this we obtain the gid and the name of the parent artist
       INNER JOIN (SELECT entity0,
                          entity1,
                          link_info.link_type,
                          artist_parent.gid,
                          artist_parent.name
                   FROM l_artist_artist rel_artist
                          JOIN artist artist_parent
                               ON rel_artist.entity1 = artist_parent.id
                          JOIN link link_info
                               ON rel_artist.link = link_info.id
                   WHERE link_info.link_type = 103) AS relation
                  ON artist.id = relation.entity0;

-- Query for the supporting artist of a group
SELECT artist.gid    AS supporter_gid,
       artist.name   AS supporter_name,
       relation.gid  AS band_gid,
       relation.name AS band_name,
       relation.link_type
FROM artist
       -- With this we obtain the gid and the name of the parent artist
       INNER JOIN (SELECT entity0,
                          entity1,
                          link_info.link_type,
                          artist_parent.gid,
                          artist_parent.name
                   FROM l_artist_artist rel_artist
                          JOIN artist artist_parent
                               ON rel_artist.entity1 = artist_parent.id
                          JOIN link link_info
                               ON rel_artist.link = link_info.id
                   WHERE link_info.link_type = 104) AS relation
                  ON artist.id = relation.entity0;

-- Type of root links
SELECT *
FROM link_type
WHERE parent IS NULL;

-- Type of links with a parent specified
SELECT *
FROM link_type
WHERE parent = 841;

-- Check if there is any link of type collaboration
SELECT l_artist_artist.id, link.link_type, entity1, a1.name, entity0, a0.name
FROM l_artist_artist
       INNER JOIN link ON l_artist_artist.link = link.id
       JOIN artist a0 ON l_artist_artist.entity0 = a0.id
       JOIN artist a1 ON l_artist_artist.entity1 = a1.id
WHERE link_type = 102;

-- Query for collaborations
SELECT artist.gid AS collaborator_gid,
       artist.name AS collaborator_name,
       relation.gid AS collaborated_gid,
       relation.name AS collaborated_name,
       relation.link_type
FROM artist
       -- With this we obtain the gid and the name of the parent artist
       INNER JOIN (SELECT entity0,
                          entity1,
                          link_info.link_type,
                          artist_parent.gid,
                          artist_parent.name
                   FROM l_artist_artist rel_artist
                          JOIN artist artist_parent
                               ON rel_artist.entity1 = artist_parent.id
                          JOIN link link_info
                               ON rel_artist.link = link_info.id
                   WHERE link_info.link_type = 102) AS relation
                  ON artist.id = relation.entity0;