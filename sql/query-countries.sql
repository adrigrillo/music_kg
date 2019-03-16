-- This query add the alias into a list
SELECT gid, area.name AS name, with_alias.aliases AS aliases, code
FROM area
       INNER JOIN iso_3166_1 AS iso
                  ON area.id = iso.area
       LEFT JOIN (SELECT a.name, string_agg(area_alias.name, ', ') AS aliases
                  FROM area a
                         INNER JOIN area_alias
                                    ON a.id = area_alias.area
                  GROUP BY a.name) AS with_alias
                 ON area.name = with_alias.name;

-- Without considering the alias
SELECT gid, id, name, code
FROM area
       INNER JOIN iso_3166_1
                  ON area.id = iso_3166_1.area;