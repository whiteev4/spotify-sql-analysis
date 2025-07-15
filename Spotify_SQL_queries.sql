Spotify Database SQL Queries

--Most Popular Artists
SELECT artists, AVG(popularity) AS most_popular
FROM spotify
GROUP BY artists
ORDER BY AVG(popularity) DESC
LIMIT 10


--Most Popular Genres
SELECT track_genre, ROUND(AVG(popularity),2) AS most_popular
FROM spotify
GROUP BY track_genre
ORDER BY AVG(popularity) DESC
LIMIT 10


--Average Song Duration By Genre
SELECT track_genre , ROUND(AVG(duration_ms)/60000,2) AS avg_duration_min
FROM spotify
GROUP BY track_genre
ORDER BY AVG(duration_ms) DESC


--Total Number of Explicit Tracks
SELECT explicit, COUNT(*)
FROM spotify
WHERE explicit = 'true'
GROUP BY explicit


--Number of Explicit Tracks Per Genre
SELECT track_genre, COUNT (*) AS count_explicit
FROM spotify
WHERE explicit = 'true'
GROUP BY track_genre


--Average Danceability by Genre
SELECT track_genre, ROUND(AVG(danceability),2) AS avg_danceability
FROM spotify
GROUP BY track_genre
ORDER BY AVG(danceability) DESC


--Top 5 Loudest Genres
SELECT track_genre, ROUND(AVG(loudness),2) AS avg_danceability
FROM spotify
GROUP BY track_genre
ORDER BY AVG(loudness) DESC
LIMIT 5


--Total Major and Minor Punk Songs
SELECT
CASE
	WHEN mode = 1 THEN 'Major'
	WHEN mode = 0 THEN 'minor'
	ELSE 'unknown'
END AS mode_type,
COUNT (*) AS track_count
FROM spotify
WHERE track_genre = 'punk'
GROUP BY mode


--Top 10 Most Popular K-Pop Songs
SELECT track_name, artists, popularity 
FROM spotify
WHERE track_genre = 'k-pop'
ORDER BY popularity DESC
LIMIT 10