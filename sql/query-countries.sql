-- This query links all the alias to the areas
SELECT area.gid AS gid, area_alias.name AS alias
FROM area
       LEFT JOIN area_alias
                 ON area.id = area_alias.area
WHERE area.name != area_alias.name;

-- Without considering the alias
SELECT gid, name, code
FROM area
       INNER JOIN iso_3166_1
                  ON area.id = iso_3166_1.area;