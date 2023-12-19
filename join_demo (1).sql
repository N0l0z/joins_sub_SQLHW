-- inner join

SELECT * from artist;

SELECT * from favorite_song;


-- left table (FROM clause)
-- right table (JOIN clause)

SELECT * 
FROM artist
INNER JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id 


SELECT * 
FROM favorite_song
INNER JOIN artist
ON favorite_song.artist_id = artist.artist_id 



SELECT song_name, album, artist_name
FROM artist
INNER JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id 
WHERE artist.artist_id =2

SELECT song_name, album
from favorite_song
WHERE artist_id = 2

-- left JOIN
SELECT song_name, album, artist_name
FROM artist
LEFT JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id 

 -- reversed
SELECT song_name, album, artist_name
FROM favorite_song
LEFT JOIN artist
ON favorite_song.artist_id = artist.artist_id 

SELECT * 
FROM favorite_song
LEFT JOIN artist
ON favorite_song.artist_id = artist.artist_id 


SELECT *
from artist
FULL JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id 


-- ambiguous column example
SELECT song_name, album, artist_name, artist_id  
-- we have to specifcy WHERE this column is coming from
from artist
FULL JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id 

SELECT song_name, album, artist_name, favorite_song.artist_id  
from artist
FULL JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id 


SELECT favorite_song.song_name, favorite_song.album, artist_name, favorite_song.artist_id  
from artist
FULL JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id 

SELECT song_name, album, artist_name, fs.artist_id  
from artist AS a
FULL JOIN favorite_song AS fs
ON fs.artist_id = a.artist_id 

SELECT song_name, album, artist_name
from artist AS a
FULL JOIN favorite_song AS fs
ON fs.artist_id = a.artist_id 
WHERE album like 'V%'
ORDER BY song_name DESC