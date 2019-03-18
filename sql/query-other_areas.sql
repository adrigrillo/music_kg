-- Select Subdivision
SELECT area.gid, area.name AS name, with_alias.aliases AS aliases, relation.gid AS parent_gid
FROM area
       -- With this we obtain the aliases of the area
       LEFT JOIN (SELECT a.name, string_agg(area_alias.name, ', ') AS aliases
                  FROM area a
                         INNER JOIN area_alias
                                    ON a.id = area_alias.area
                  GROUP BY a.name) AS with_alias
                 ON area.name = with_alias.name
       -- With this we obtain the gid and the name of the parent area
       LEFT JOIN (SELECT entity0, entity1, area_parent.gid
                  FROM l_area_area rel_area
                         JOIN area area_parent
                              ON rel_area.entity0 = area_parent.id) AS relation
                 ON area.id = relation.entity1
WHERE type = 2;

-- Select cities
SELECT area.gid, area.name AS name, with_alias.aliases AS aliases, relation.gid AS parent_gid
FROM area
       -- With this we obtain the aliases of the area
       LEFT JOIN (SELECT a.name, string_agg(area_alias.name, ', ') AS aliases
                  FROM area a
                         INNER JOIN area_alias
                                    ON a.id = area_alias.area
                  GROUP BY a.name) AS with_alias
                 ON area.name = with_alias.name
       -- With this we obtain the gid and the name of the parent area
       LEFT JOIN (SELECT entity0, entity1, area_parent.gid
                  FROM l_area_area rel_area
                         JOIN area area_parent
                              ON rel_area.entity0 = area_parent.id) AS relation
                 ON area.id = relation.entity1
WHERE type = 3;

-- Select municipalities
SELECT area.gid, area.name AS name, with_alias.aliases AS aliases, relation.gid AS parent_gid
FROM area
       -- With this we obtain the aliases of the area
       LEFT JOIN (SELECT a.name, string_agg(area_alias.name, ', ') AS aliases
                  FROM area a
                         INNER JOIN area_alias
                                    ON a.id = area_alias.area
                  GROUP BY a.name) AS with_alias
                 ON area.name = with_alias.name
       -- With this we obtain the gi of the parent area
       LEFT JOIN (SELECT entity0, entity1, area_parent.gid
                  FROM l_area_area rel_area
                         JOIN area area_parent
                              ON rel_area.entity0 = area_parent.id) AS relation
                 ON area.id = relation.entity1
WHERE type = 4;

-- Select district
SELECT area.gid, area.name AS name, with_alias.aliases AS aliases, relation.gid AS parent_gid
FROM area
       -- With this we obtain the aliases of the area
       LEFT JOIN (SELECT a.name, string_agg(area_alias.name, ', ') AS aliases
                  FROM area a
                         INNER JOIN area_alias
                                    ON a.id = area_alias.area
                  GROUP BY a.name) AS with_alias
                 ON area.name = with_alias.name
       -- With this we obtain the gid and the name of the parent area
       LEFT JOIN (SELECT entity0, entity1, area_parent.gid
                  FROM l_area_area rel_area
                         JOIN area area_parent
                              ON rel_area.entity0 = area_parent.id) AS relation
                 ON area.id = relation.entity1
WHERE type = 5;

-- Select island
SELECT area.gid, area.name AS name, with_alias.aliases AS aliases, relation.gid AS parent_gid
FROM area
       -- With this we obtain the aliases of the area
       LEFT JOIN (SELECT a.name, string_agg(area_alias.name, ', ') AS aliases
                  FROM area a
                         INNER JOIN area_alias
                                    ON a.id = area_alias.area
                  GROUP BY a.name) AS with_alias
                 ON area.name = with_alias.name
       -- With this we obtain the gid and the name of the parent area
       LEFT JOIN (SELECT entity0, entity1, area_parent.gid
                  FROM l_area_area rel_area
                         JOIN area area_parent
                              ON rel_area.entity0 = area_parent.id) AS relation
                 ON area.id = relation.entity1
WHERE type = 6;

-- Select county
SELECT area.gid, area.name AS name, with_alias.aliases AS aliases, relation.gid AS parent_gid
FROM area
       -- With this we obtain the aliases of the area
       LEFT JOIN (SELECT a.name, string_agg(area_alias.name, ', ') AS aliases
                  FROM area a
                         INNER JOIN area_alias
                                    ON a.id = area_alias.area
                  GROUP BY a.name) AS with_alias
                 ON area.name = with_alias.name
       -- With this we obtain the gid and the name of the parent area
       LEFT JOIN (SELECT entity0, entity1, area_parent.gid
                  FROM l_area_area rel_area
                         JOIN area area_parent
                              ON rel_area.entity0 = area_parent.id) AS relation
                 ON area.id = relation.entity1
WHERE type = 7;