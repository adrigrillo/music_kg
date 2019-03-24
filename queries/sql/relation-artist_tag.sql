SELECT *
FROM artist
       -- Search for the tags
       LEFT JOIN (SELECT art_tags.artist,
                         string_agg(tag_desc.name, ', ') AS tags
                  FROM artist_tag art_tags
                         JOIN tag tag_desc
                              ON art_tags.tag = tag_desc.id
                  GROUP BY art_tags.artist) AS tag_name
                 ON artist.id = tag_name.artist