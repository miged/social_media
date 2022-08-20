# README

Social media API, build with Ruby on Rails 7.0.3.1 and SQLite.

Controller code is located in `app/controllers`

Test code is located in `test/controllers`

## Running the server

- Make sure Ruby 3.0.3 is installed

- Setup database with `bin/rails db:setup`

- Run server with `bin/rails server`

- Run tests with `bin/rails test`

# API

## User

```
POST /register
{
	"username": "john",
	"password_digest": "password123"
}
```

```
POST /login
{
	"username": "john",
	"password_digest": "password123"
}
```

## Tweets

```
GET /tweet
```

```
GET /tweet/:id
```

```
POST /tweet
{
	"body_text": "Hello world!",
	"user_id": 1
}
```

```
PUT /tweet/:id
{
	"body_text": "Edited text",
	"user_id": 1
}
```

```
DELETE /tweet/:id
{
    "user_id": 1
}
```
