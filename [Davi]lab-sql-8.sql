-- Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.
SELECT TITLE, LENGTH, RANK() OVER(ORDER BY LENGTH DESC) as RANKING
FROM SAKILA.FILM
WHERE LENGTH > 0;

-- Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). 
-- In your output, only select the columns title, length, rating and rank.
SELECT TITLE, LENGTH, RATING, RANK() OVER(PARTITION BY RATING ORDER BY LENGTH DESC) AS RANKING
FROM SAKILA.FILM
WHERE LENGTH > 0;

-- How many films are there for each of the categories in the category table? Hint: Use appropriate join between the tables "category" and "film_category".
SELECT COUNT(C1.FILM_ID), C1.CATEGORY_ID
FROM SAKILA.FILM_CATEGORY C1
LEFT JOIN SAKILA.CATEGORY C2
	ON C1.CATEGORY_ID = C2.CATEGORY_ID
GROUP BY CATEGORY_ID;

-- Which actor has appeared in the most films? Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.
SELECT COUNT(A.ACTOR_ID), A.FIRST_NAME, A.LAST_NAME
FROM SAKILA.FILM_ACTOR F
LEFT JOIN SAKILA.ACTOR A
	ON F.ACTOR_ID = A.ACTOR_ID
GROUP BY FIRST_NAME, LAST_NAME
ORDER BY COUNT(A.ACTOR_ID) DESC
LIMIT 1
;

-- Which is the most active customer (the customer that has rented the most number of films)? 
-- Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer. 
SELECT COUNT(C.customer_id), C.FIRST_NAME, C.LAST_NAME
FROM SAKILA.RENTAL R
LEFT JOIN SAKILA.CUSTOMER C
	ON R.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY FIRST_NAME, LAST_NAME
ORDER BY COUNT(C.CUSTOMER_ID) DESC
LIMIT 1
;