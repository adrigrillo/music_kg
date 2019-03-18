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

-- how to obtain the area that contains the given area
SELECT area.gid, area.name AS name, relation.gid, relation.name
FROM area
       -- With this we obtain the gid and the name of the parent area
       LEFT JOIN (SELECT entity0, entity1, area_parent.gid, area_parent.name
             FROM l_area_area rel_area
                    JOIN area area_parent
                         ON rel_area.entity0 = area_parent.id) AS relation
            ON area.id = relation.entity1
LIMIT 50;