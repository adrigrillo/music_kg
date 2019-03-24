-- Area types
SELECT *
FROM area_type;

-- l_area_area
SELECT *
FROM l_area_area
WHERE entity0 > entity1
LIMIT 1;

-- here we can see that 222 is united states and 4 american samoa is part of it
SELECT *
FROM area
WHERE id = 222
   OR id = 4;

-- how to obtain the area that contains the given area using the more correct way using link
SELECT area.gid, area.name AS name, relation.gid, relation.name, lk_tp.link_type
FROM area
       -- With this we obtain the gid and the name of the parent area
       JOIN (SELECT entity0, entity1, link, area_parent.gid, area_parent.name
             FROM l_area_area rel_area
                    JOIN area area_parent
                         ON rel_area.entity0 = area_parent.id) AS relation
            ON area.id = relation.entity1
       JOIN (SELECT id, link_type
             FROM link) AS lk_tp
            ON relation.link = lk_tp.id
WHERE lk_tp.link_type = 356
LIMIT 50;

-- how to obtain the area that contains the given area without link
SELECT area.gid, area.name AS name, relation.gid, relation.name
FROM area
       -- With this we obtain the gid and the name of the parent area
       JOIN (SELECT entity0, entity1, area_parent.gid, area_parent.name
             FROM l_area_area rel_area
                    JOIN area area_parent
                         ON rel_area.entity0 = area_parent.id) AS relation
            ON area.id = relation.entity1
LIMIT 50;

-- See the link type
SELECT *
FROM link_type
WHERE id = 356
LIMIT 50;