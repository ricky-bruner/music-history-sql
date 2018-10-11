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