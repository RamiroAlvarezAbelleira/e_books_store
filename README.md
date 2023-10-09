# README



# API

--show
get /api/v1/books/:id

--index
get /api/v1/books

-pagination
/api/v1/books?page=1&per_page=2

-filters
/api/v1/books?title=Sample
/api/v1/books?min_price=10&max_price=20
/api/v1/books?author_id=1

--create
post /api/v1/books

-body format
{"book": {
  "title": "Title from api",
  "author_id": 8,
  "publisher_id": 8,
  "isbn": "0743273567",
  "date_of_publication": "2023-10-10",
  "review": "review",
  "price": 200
}}

--update
put /api/v1/books/:id

-body format
{"book": {
  "title": "Title from api",
  "author_id": 8,
  "publisher_id": 8,
  "isbn": "0743273567",
  "date_of_publication": "2023-10-10",
  "review": "review",
  "price": 200
}}
