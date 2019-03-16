-- Artist with area
SELECT t.*
FROM musicbrainz.area t
WHERE id = (SELECT area FROM musicbrainz.artist t WHERE name = 'La Raíz');
-- Artist area with place
SELECT t.*
FROM musicbrainz.place t
WHERE area = (SELECT area FROM musicbrainz.artist t WHERE name = 'La Raíz');
-- Artist area with other areas
SELECT t.*
FROM l_area_area t
WHERE entity0 = (SELECT area FROM musicbrainz.artist t WHERE name = 'La Raíz')
   OR entity1 = (SELECT area FROM musicbrainz.artist t WHERE name = 'La Raíz');
-- Go up in the relations (City)
SELECT t.*
FROM musicbrainz.area t
WHERE id = 4354;
SELECT t.*
FROM l_area_area t
WHERE entity1 = 4354;
-- region
SELECT t.*
FROM musicbrainz.area t
WHERE id = 1828;
SELECT t.*
FROM l_area_area t
WHERE entity1 = 1828;
-- Country
SELECT t.*
FROM musicbrainz.area t
WHERE id = 194;