/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
SELECT DISTINCT "name" AS "Actor Name"
FROM (
    SELECT first_name || ' ' || last_name AS "name", unnest(special_features) AS "special"
    FROM actor
    INNER JOIN film_actor USING (actor_id)
    INNER JOIN film USING (film_id)
) AS t
WHERE "special" = 'Behind the Scenes'
ORDER BY "Actor Name";
