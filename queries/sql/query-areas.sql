-- Select countries
SELECT gid, name, code
FROM area
       INNER JOIN iso_3166_1
                  ON area.id = iso_3166_1.area;

-- Select Subdivision
SELECT area.gid, area.name AS name, relation.gid AS parent_gid
FROM area
       -- With this we obtain the gid and the name of the parent area
       JOIN (SELECT entity0, entity1, link, area_parent.gid
             FROM l_area_area rel_area
                    JOIN area area_parent
                         ON rel_area.entity0 = area_parent.id) AS relation
            ON area.id = relation.entity1
       JOIN (SELECT id, link_type
             FROM link) AS lk_tp
            ON relation.link = lk_tp.id
WHERE type = 2
  AND lk_tp.link_type = 356;

-- Select cities
SELECT area.gid, area.name AS name, relation.gid AS parent_gid
FROM area
       -- With this we obtain the gid and the name of the parent area
       JOIN (SELECT entity0, entity1, link, area_parent.gid
             FROM l_area_area rel_area
                    JOIN area area_parent
                         ON rel_area.entity0 = area_parent.id) AS relation
            ON area.id = relation.entity1
       JOIN (SELECT id, link_type
             FROM link) AS lk_tp
            ON relation.link = lk_tp.id
WHERE type = 3
  AND lk_tp.link_type = 356;

-- Select municipalities
SELECT area.gid, area.name AS name, relation.gid AS parent_gid
FROM area
       -- With this we obtain the gid and the name of the parent area
       JOIN (SELECT entity0, entity1, link, area_parent.gid
             FROM l_area_area rel_area
                    JOIN area area_parent
                         ON rel_area.entity0 = area_parent.id) AS relation
            ON area.id = relation.entity1
       JOIN (SELECT id, link_type
             FROM link) AS lk_tp
            ON relation.link = lk_tp.id
WHERE type = 4
  AND lk_tp.link_type = 356;

-- Select district
SELECT area.gid, area.name AS name, relation.gid AS parent_gid
FROM area
       -- With this we obtain the gid and the name of the parent area
       JOIN (SELECT entity0, entity1, link, area_parent.gid
             FROM l_area_area rel_area
                    JOIN area area_parent
                         ON rel_area.entity0 = area_parent.id) AS relation
            ON area.id = relation.entity1
       JOIN (SELECT id, link_type
             FROM link) AS lk_tp
            ON relation.link = lk_tp.id
WHERE type = 5
  AND lk_tp.link_type = 356;

-- Select island
SELECT area.gid, area.name AS name, relation.gid AS parent_gid
FROM area
       -- With this we obtain the gid and the name of the parent area
       JOIN (SELECT entity0, entity1, link, area_parent.gid
             FROM l_area_area rel_area
                    JOIN area area_parent
                         ON rel_area.entity0 = area_parent.id) AS relation
            ON area.id = relation.entity1
       JOIN (SELECT id, link_type
             FROM link) AS lk_tp
            ON relation.link = lk_tp.id
WHERE type = 6
  AND lk_tp.link_type = 356;

-- Select county
SELECT area.gid, area.name AS name, relation.gid AS parent_gid
FROM area
       -- With this we obtain the gid and the name of the parent area
       JOIN (SELECT entity0, entity1, link, area_parent.gid
             FROM l_area_area rel_area
                    JOIN area area_parent
                         ON rel_area.entity0 = area_parent.id) AS relation
            ON area.id = relation.entity1
       JOIN (SELECT id, link_type
             FROM link) AS lk_tp
            ON relation.link = lk_tp.id
WHERE type = 7
  AND lk_tp.link_type = 356;

-- This query links all the alias to the areas
SELECT area.gid AS gid, area_alias.name AS alias
FROM area
       LEFT JOIN area_alias
                 ON area.id = area_alias.area
WHERE area.name != area_alias.name;