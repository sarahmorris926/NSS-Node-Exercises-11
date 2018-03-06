-- (1) Query all of the entries in the Genre table
SELECT * FROM Genre;

-- (2) Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO "Artist" ("ArtistName", "YearEstablished")
 VALUES ("John Mayer", "1999");

-- (3) Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO "Album" ("Title", "ReleaseDate", "AlbumLength", "Label", "GenreId")
-- (SELECT artistId FROM artist WHERE ArtistName = "John Mayer") can be used to generate the ArtistId
 VALUES ("Room For Squares", "2001", 3436, "Columbia", 2);

 -- Joe's Example 
-- INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
-- SELECT "Georgetown Station", 1986, 2345, "Fifth Column Records", ar.ArtistId, g.GenreId 
-- FROM Artist ar, Genre g
-- WHERE ar.ArtistName = "The Model Citizens"
-- and g.Label = "Rock"

-- (4) Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO "Song" ("SongId", "Title", "SongLength", "ReleaseDate", "GenreId", "ArtistId", "AlbumId")
 VALUES (null, "No Such Thing", 0351, "2001", 
 (SELECT genreId FROM album a WHERE title = "Room For Squares"), 
 (SELECT artistId FROM album a WHERE title = "Room For Squares"), 
 (SELECT AlbumId FROM album a WHERE title = "Room For Squares"));

INSERT INTO "Song" ("SongId", "Title", "SongLength", "ReleaseDate", "GenreId", "ArtistId", "AlbumId")
VALUES (null, "St. Patrick's Day", 0520, "2001", 
(SELECT genreId FROM album a WHERE title = "Room For Squares"),
(SELECT artistId FROM album a WHERE title = "Room For Squares"),
(SELECT AlbumId FROM album a WHERE title = "Room For Squares"))

-- Joe's Example
-- INSERT INTO Song
-- SELECT null, "Second Sight", 5768, "1986", g.GenreId, ar.ArtistId, al.AlbumId
-- FROM Artist ar, Genre g, Album al
-- WHERE ar.ArtistName = "The Model Citizens"
-- and g.Label = "Rock"
-- and al.Title = "Georgetown Station"

-- (5) Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT s.Title as "Song Title", a.title as "Album Title", b.ArtistName
FROM Song s
LEFT JOIN Album a 
ON s.AlbumId = a.AlbumId
LEFT JOIN Artist b
ON s.artistId = b.artistId
WHERE s.AlbumId = (SELECT albumid FROM album WHERE title = "Room For Squares")
--(6) Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.


-- (7) Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.


-- (8) Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.


-- (9) Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.


-- (10) Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.


-- (11) Modify the previous query to also display the title of the album.

