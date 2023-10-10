# README



# API Endpoints

## Show Book
- **Endpoint:** `GET /api/v1/books/:id`

## Index Books
- **Endpoint:** `GET /api/v1/books`
- **Pagination:**
  - `/api/v1/books?page=1&per_page=2`
- **Filters:**
  - `/api/v1/books?title=Sample`
  - `/api/v1/books?min_price=10&max_price=20`
  - `/api/v1/books?author_id=1`

## Create Book
- **Endpoint:** `POST /api/v1/books`
- **Request Body Format:**
  ```json
  {
    "book": {
      "title": "Title from api",
      "author_id": 8,
      "publisher_id": 8,
      "isbn": "0743273567",
      "date_of_publication": "2023-10-10",
      "review": "review",
      "price": 200
    }
  }

## Update Book
- **Endpoint:** `PuT /api/v1/books/:id`
- **Request Body Format:**
  ```json
  {
    "book": {
      "title": "Title from api",
      "author_id": 8,
      "publisher_id": 8,
      "isbn": "0743273567",
      "date_of_publication": "2023-10-10",
      "review": "review",
      "price": 200
    }
  }
