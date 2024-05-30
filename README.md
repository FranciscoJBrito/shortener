# Shortener

## Description

**Shortener** is a web application designed to shorten long URLs, making them easier to share and manage. This project uses Ruby on Rails for the backend and Tailwind CSS along with Stimulus for the frontend, providing a fast and reliable URL shortening service.

## Features

- Shorten long URLs to short, easy-to-remember links.
- Fast and efficient redirection.
- Simple and intuitive user interface.
- Storage of shortened links.
- Basic usage statistics (coming soon).

## Technologies Used

- Ruby, Ruby on Rails
- Tailwind CSS, Stimulus
- PostgreSQL
- Docker

## Installation

### Prerequisites

- Ruby 3.0.6
- Rails 7.0.8
- PostgreSQL
- Docker (optional)

### Clone the Repository

```bash
git clone https://github.com/FranciscoJBrito/shortener.git
cd shortener
```

### Environment Setup

Create a .env file in the root of the project with the following environment variables:

```env
RAILS_ENV=development
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=123456
DATABASE_HOST=postgres
DATABASE_PORT=5432
HOST=localhost:3000
```

### Run with Docker

Build and run Docker containers:

```bash
docker-compose up --build
```

The application will be available at `http://localhost:3000`.

### Contributing

Contributions are welcome. To contribute, follow these steps:

1. Fork the repository.
2. Create a new branch (git checkout -b feature/new-feature).
3. Make your changes and commit them (git commit -am 'Add new feature').
4. Push your changes to your fork (git push origin feature/new-feature).
5. Open a Pull Request.
