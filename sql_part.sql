-- Q6
SELECT * FROM books WHERE books.publishing_year < 1985

-- Q7
SELECT * FROM books
JOIN authors ON books.author_id = authors.id
WHERE authors.name = 'Jules Verne'
ORDER BY books.publishing_year DESC LIMIT 3
