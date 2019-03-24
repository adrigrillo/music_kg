-- Artist as a person
SELECT artist.gid,
       artist.name,
       artist.sort_name,
       artist.begin_date_year,
       artist.end_date_year,
       CASE
         WHEN artist.gender = 1 THEN 'male'
         WHEN artist.gender = 2 THEN 'female'
         END    AS gender,
       area.gid AS area_gid
FROM artist
       LEFT JOIN area
                 ON artist.area = area.id
WHERE artist.type = 1
   OR artist.type = 4;

-- Artist as a group
SELECT artist.gid,
       artist.name,
       artist.sort_name,
       artist.begin_date_year,
       artist.end_date_year,
       area.gid AS area_gid
FROM artist
       LEFT JOIN area
                 ON artist.area = area.id
WHERE artist.type = 2
   OR artist.type = 5
   OR artist.type = 6;

-- Query for the members of a group
SELECT artist.gid   AS member_gid,
       relation.gid AS band_gid
FROM artist
       INNER JOIN (SELECT entity0,
                          entity1,
                          link_info.link_type,
                          artist_parent.gid
                   FROM l_artist_artist rel_artist
                          JOIN artist artist_parent
                               ON rel_artist.entity1 = artist_parent.id
                          JOIN link link_info
                               ON rel_artist.link = link_info.id
                   WHERE link_info.link_type = 103) AS relation
                  ON artist.id = relation.entity0;

-- Query for the supporting artist of a group
SELECT artist.gid   AS supporter_gid,
       relation.gid AS band_gid
FROM artist
       INNER JOIN (SELECT entity0,
                          entity1,
                          link_info.link_type,
                          artist_parent.gid
                   FROM l_artist_artist rel_artist
                          JOIN artist artist_parent
                               ON rel_artist.entity1 = artist_parent.id
                          JOIN link link_info
                               ON rel_artist.link = link_info.id
                   WHERE link_info.link_type = 104) AS relation
                  ON artist.id = relation.entity0;

-- Query for collaborations
SELECT artist.gid    AS collaborator_gid,
       relation.gid  AS collaborated_gid,
       relation.link_type
FROM artist
       INNER JOIN (SELECT entity0,
                          entity1,
                          link_info.link_type,
                          artist_parent.gid
                   FROM l_artist_artist rel_artist
                          JOIN artist artist_parent
                               ON rel_artist.entity1 = artist_parent.id
                          JOIN link link_info
                               ON rel_artist.link = link_info.id
                   WHERE link_info.link_type = 102) AS relation
                  ON artist.id = relation.entity0;

-- Alias artist query
SELECT artist.gid AS gid, artist_alias.name AS alias
FROM artist
       JOIN artist_alias
            ON artist.id = artist_alias.artist
WHERE artist.name != artist_alias.name;

-- Genres artist query
SELECT artist.gid AS gid, tag_name.name AS name
FROM artist
       JOIN (SELECT art_tags.artist, tag_desc.name AS name
                  FROM artist_tag art_tags
                         JOIN tag tag_desc
                              ON art_tags.tag = tag_desc.id) AS tag_name
                 ON artist.id = tag_name.artist;