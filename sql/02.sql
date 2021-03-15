/*
 * Count the number of movies that contain each type of special feature.
 */
SELECT DISTINCT unnest(special_features) AS "special_features", count(*)
FROM film
GROUP BY unnest(special_features)
ORDER BY "special_features";
