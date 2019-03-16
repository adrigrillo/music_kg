SELECT t.*
FROM musicbrainz.url t
where url = 'http://www.laraiz.es/'
LIMIT 500;
SELECT t.*
FROM musicbrainz.url t
where url = 'https://laraiz.bandcamp.com/'
LIMIT 500;

SELECT t.*
FROM musicbrainz.l_artist_url t
WHERE entity0 = (SELECT id FROM musicbrainz.artist t where name = 'La Raíz')
   OR entity1 = (SELECT id FROM musicbrainz.artist t where name = 'La Raíz');
