/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */
SELECT DISTINCT first_name || ' ' || last_name AS "Actor Name"
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE title IN (
    SELECT title 
    FROM film
    INNER JOIN film_actor USING (film_id)
    WHERE film_actor.actor_id IN (
        SELECT DISTINCT a2.actor_id
        FROM actor a1
        INNER JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
        INNER JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
        INNER JOIN actor a2 ON fa2.actor_id = a2.actor_id
        WHERE a1.actor_id = 112 AND a2.actor_id != 112
        )
    ) 
AND actor.actor_id NOT IN (
     SELECT DISTINCT a2.actor_id
     FROM actor a1
     INNER JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
     INNER JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
     INNER JOIN actor a2 ON fa2.actor_id = a2.actor_id
     WHERE a1.actor_id = 112)
ORDER BY "Actor Name";
