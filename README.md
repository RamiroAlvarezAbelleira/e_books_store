# eBooksStore

eBookStore is a sample e-commerce platform designed for selling books. This application includes a user-friendly web interface for customers to browse and purchase books. It also provides a back office for administrators to manage products, authors, and publishers.

## Prerequisites

Before setting up eBookStore, ensure you have the following software installed on your local machine:

- Ruby (version 3.1.2)
- Rails (version 7.0.8)
- PostgreSQL
- Redis (version 7.2.1)
- Node.js (version 16.15.1)

## Installation

To get started with eBookStore, follow these steps:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/RamiroAlvarezAbelleira/e_books_store.git

2. Navigate to the project's root directory:
   ```bash
   cd e_books_store

3. Install dependancies
   ```bash
   bundle install

4. create .env file based on .env.sample (you will find some instructions there)

5. Uncomment this line (config.secret_key_base = ENV['SECRET_KEY_BASE']) on application.rb

6. Set up the database (Seed admin (admin@mail.com, password: 12345678))
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed

7. Start the Rails server:
   ```bash
   rails s

9. Run this command on a new terminal tab to use Sidekiq. Ensure you have Redis (version 7.2.1) installed:
   ```bash
   bundle exec sidekiq

# Features

## CRUD System
- **Books:** Create, Read, Update, and Delete (CRUD) operations for managing books.
- **Authors:** CRUD operations for managing authors.
- **Publishers:** CRUD operations for managing publishers.
- Simple validations for books authors and publishers.

## User Authentication
- User registration and sign-in system. (password recovery work on development with mailcatcher)
- Utilizes Devise for user authentication.
- Pundit is used for simple admin validations.

## Back Office
- Access the back office for managing books, authors, and publishers.
- Admin-level access control using Pundit for managing data.
- Applied filters with ransack for books, authors and publishers.
- Automatically update book prices based on a percentage increase or decrease Filtered by publisher with background job processing powered by Sidekiq and Redis. (works on development)
- Pagination system using will_paginate.
- Utilizes Hotwire functionalities with Turbo Stream for real-time updates and error handling.

## Front End
- Simple and user-friendly front-end interface.
- Bootstrap styling for an attractive and responsive design.
- List of available books with individual "show" methods for details.
- Implemented a search bar for books with pg_search (search by title, isbn, authors name and publishers name)

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
- **Endpoint:** `PUT /api/v1/books/:id`
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
