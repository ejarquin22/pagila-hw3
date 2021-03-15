/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 */
SELECT title 
FROM (
    SELECT film_id, title, unnest(special_features), rating
    FROM film
) AS t
WHERE rating = 'G' AND unnest='Trailers'
ORDER BY title DESC;
