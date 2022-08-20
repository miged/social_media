# README

Social media API, build with Ruby on Rails 7.0.3.1 and SQLite.

Controller code is located in `app/controllers`

Test code is located in `test/controllers`

## Running the server

- Make sure Ruby 3.0.3 is installed

- Setup database with `bin/rails db:setup`

- Run server with `bin/rails server`

- Run tests with `bin/rails test`

## API

### User

Register a user

```
POST /register
{
	"username": "john",
	"password_digest": "password123"
}
```

Login

```
POST /login
{
	"username": "john",
	"password_digest": "password123"
}
```

### Tweets

Get all tweets

```
GET /tweet
```

Get a tweet by id

```
GET /tweet/:id
```

Create a tweet

```
POST /tweet
{
	"body_text": "Hello world!",
	"user_id": 1
}
```

Edit a tweet

```
PUT /tweet/:id
{
	"body_text": "Edited text",
	"user_id": 1
}
```

Delete a tweet

```
DELETE /tweet/:id
{
    "user_id": 1
}
```
