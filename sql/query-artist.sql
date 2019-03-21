-- Alias artist query
SELECT artist.gid AS gid, artist_alias.name AS alias
FROM artist
       LEFT JOIN artist_alias
                 ON artist.id = artist_alias.artist
WHERE artist.name != artist_alias.name;

SELECT artist.gid,
       artist.name,
       artist.sort_name,
       with_alias.aliases,
       artist.begin_date_year,
       artist.end_date_year,
       CASE
         WHEN artist.gender = 1 THEN 'male'
         WHEN artist.gender = 2 THEN 'female'
         END,
       area.gid      AS area_gid,
       tag_name.tags
FROM artist
       -- Search for the aliases
       LEFT JOIN (SELECT a.id, string_agg(artist_alias.name, ', ') AS aliases
                  FROM artist a
                         LEFT JOIN artist_alias
                                   ON a.id = artist_alias.artist
                  GROUP BY a.id) AS with_alias
                 ON artist.id = with_alias.id
  -- Search for the area
       LEFT JOIN area
                 ON artist.area = area.id
  -- Search for the tags
       LEFT JOIN (SELECT art_tags.artist,
                         string_agg(tag_desc.name, ', ') AS tags
                  FROM artist_tag art_tags
                         JOIN tag tag_desc
                              ON art_tags.tag = tag_desc.id
                  GROUP BY art_tags.artist) AS tag_name
                 ON artist.id = tag_name.artist
WHERE artist.type = 1;