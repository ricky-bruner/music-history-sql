SELECT ArtistName, YearEstablished 
FROM Artist
WHERE YearEstablished > 1970
AND YearEstablished < 2000
ORDER BY YearEstablished DESC
;

SELECT a.Title,
			  a.AlbumLength,
			  a.Label AS RecordLabel,
			  ar.ArtistName,
			  ar.YearEstablished,
			  g.Label AS GenreLable
FROM Album a
JOIN Artist ar ON a.ArtistId = ar.ArtistId
JOIN Genre g ON a.GenreId = g.GenreId
;

SELECT *
FROM Song s
JOIN Album al ON al.AlbumId = s.AlbumId
JOIN Artist ar ON ar.ArtistId = s.ArtistId
JOIN Genre g ON g.GenreId = s.GenreId
;

INSERT INTO Artist 
(ArtistName, YearEstablished)
VALUES 
("Steve Brownlee",  2018)
;


SELECT * FROM Artist
;

DELETE FROM Artist WHERE ArtistId = 35
;

UPDATE Artist
	SET ArtistName = "Steve Browleeee"
WHERE ArtistId = 32
;


SELECT g.Label, COUNT(al.AlbumId) AS AlbumCount
FROM Genre g
JOIN Album al ON al.GenreId = g.GenreId
GROUP BY g.Label
ORDER BY AlbumCount DESC 
LIMIT 1
;

SELECT al.Title, 
			MAX(al.AlbumLength)
FROM Album al
;

-- END INSTRUCTION CODE

-- BEGIN EXERCISE

--Query all of the entries in the Genre table

SELECT * FROM Genre;

--Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist
(ArtistName, YearEstablished)
VALUES
("Dejan Steponawitch", 2018)
;

SELECT * FROM Artist;

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album 
SELECT NULL, "Bosnian Christmas Music", "10/10/2018", 4026, "Def Jam", Artist.ArtistId, Genre.GenreId
FROM Artist, Genre
WHERE Artist.ArtistName = "Dejan Steponawitch"
AND Genre.Label = "Rap"
;


INSERT INTO Album
SELECT NULL, "Bosnian Halloween Music", "10/10/2018", 3876, "Polka Jam", Artist.ArtistId, Genre.GenreId
FROM Artist, Genre
WHERE Artist.ArtistName = "Dejan Steponawitch"
AND Genre.Label = "Rock"
;

--Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song
SELECT NULL, "Gibberish 1", 146, "10/10/2018", g.GenreId, a.ArtistId, al.AlbumId
FROM Artist a, Genre g, Album al
WHERE a.ArtistName = "Dejan Steponawitch"
AND g.Label = "Rock"
AND al.Title = "Bosnian Halloween Music"
;

INSERT INTO Song
SELECT NULL, "Gibberish 2", 156, "10/10/2018", g.GenreId, a.ArtistId, al.AlbumId
FROM Artist a, Genre g, Album al
WHERE a.ArtistName = "Dejan Steponawitch"
AND g.Label = "Rock"
AND al.Title = "Bosnian Halloween Music"
;

INSERT INTO Song
SELECT NULL, "Gibberish 3", 136, "10/10/2018", g.GenreId, a.ArtistId, al.AlbumId
FROM Artist a, Genre g, Album al
WHERE a.ArtistName = "Dejan Steponawitch"
AND g.Label = "Rock"
AND al.Title = "Bosnian Halloween Music"
;

INSERT INTO Song
SELECT NULL, "Kazak 1", 113, "10/10/2018", g.GenreId, a.ArtistId, al.AlbumId
FROM Artist a, Genre g, Album al
WHERE a.ArtistName = "Dejan Steponawitch"
AND g.Label = "Rap"
AND al.Title = "Bosnian Christmas Music"
;

INSERT INTO Song
SELECT NULL, "Kazak 2", 153, "10/10/2018", g.GenreId, a.ArtistId, al.AlbumId
FROM Artist a, Genre g, Album al
WHERE a.ArtistName = "Dejan Steponawitch"
AND g.Label = "Rap"
AND al.Title = "Bosnian Christmas Music"
;

INSERT INTO Song
SELECT NULL, "Kazak 3", 453, "10/10/2018", g.GenreId, a.ArtistId, al.AlbumId
FROM Artist a, Genre g, Album al
WHERE a.ArtistName = "Dejan Steponawitch"
AND g.Label = "Rap"
AND al.Title = "Bosnian Christmas Music"
;

--Write a SELECT query that provides the song titles, album title, 
--and artist name for all of the data you just entered in. 
--Use the LEFT JOIN keyword sequence to connect the tables, 
--and the WHERE keyword to filter the results to the album and artist you added.

--Reminder: Direction of join matters. Try the following statements and see the difference in results.

--SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
--SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

SELECT s.Title, a.ArtistName, al.Title
FROM Song s
LEFT JOIN Album al ON al.AlbumId = s.AlbumId
JOIN Artist a ON a.ArtistId = s.ArtistId
WHERE a.ArtistName = "Dejan Steponawitch"
;

--Write a SELECT statement to display how many songs exist for each album. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT al.Title, COUNT(s.SongId) AS SongCount
FROM Album al
LEFT JOIN Song s ON al.AlbumId = s.AlbumId
GROUP BY al.Title
;

--Write a SELECT statement to display how many songs exist for each artist. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT a.ArtistName, COUNT(s.SongId)
FROM Artist a
LEFT JOIN Song s ON a.ArtistId = s.ArtistId
GROUP BY a.ArtistName
;

--Write a SELECT statement to display how many songs exist for each genre. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT g.Label, COUNT(s.SongId)
FROM Genre g
LEFT JOIN Song s ON g.GenreId = s.GenreId
GROUP BY g.Label
;

--Using MAX() function, write a select statement to find the album with the longest duration. 
--The result should display the album title and the duration.

SELECT al.Title, 
			MAX(al.AlbumLength)
FROM Album al
;

--Using MAX() function, write a select statement to find the song with the longest duration. 
--The result should display the song title and the duration.

SELECT s.Title,
			MAX(s.SongLength)
FROM Song s
;

--Modify the previous query to also display the title of the album.

SELECT s.Title AS "Song Title", al.Title AS "Album Title", MAX(s.SongLength) AS "Song Length"
FROM Song s
LEFT JOIN Album al ON s.AlbumId = al.AlbumId
;


