# Recipe Tracker

This application is a Ruby on Rails API for storing recipes for users.  Users
can create, update, and delete recipes.

[Click Here for demo](https://sjacobs146.github.io/recipe-tracker/)

API URL:  https://sjacobs146-recipe-api.herokuapp.com

# Technologies Used
- Ruby
- Rails
- PostgreSQL

# My Planning process
Please see the front-end component of this project for more information about
my planning process, etc.: https://github.com/sjacobs146/recipe-tracker

# Entity Relationship Diagram

![Recipe Tracker ERD](/recipe-tracker-erd.png)

Note: not all of the entities were implemented

# My development process and problem-solving strategy
I began this full-stack project by implementing the back-end first.  I started
with the simplest relationship: users have many recipes.  I created the recipes
resource first. I used the Rails scaffold command to generate the database
migration script, model and controller.  Once I was able to create records in
the Recipes table, I added the relationship to users.  I updated the recipes
controller to extend ProtectedController so that users could only see and update
their own recipes.  I used shell scripts to run curl commands to test each of
my endpoints.  Most of the problems I had were copy/paste errors.  I looked at
the terminal session that was running my code locally to see the errors.  The
api code is pretty simple, so I didn't run into anything complicated.  


## A Message for my colleagues

![Obligatory Cat Photo](/RubyCat.jpg)

## API

### Recipes
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| GET    | `/recipes`             | `recipes#index`   |
| GET    | `/recipes/:id`         | `recipes#show`    |
| POST   | `/recipes`             | `recipes#create`  |
| PATCH  | `/recipes/:id`         | `recipes#update`  |
| DELETE | `/recipes/:id`         | `recipes#delete`  |

#### GET /recipes
```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/recipes"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```
```sh
TOKEN=BAhJIiU2YjQ0MDNmYTAwYjJhZWVjMTgyMmZjYTdlNTdlMGI2ZQY6BkVG--29964af2634899b453ab75d3f3e6fa080375c7c1 sh scripts/get-recipes.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
{
  "recipes": [
    {
      "id": 8,
      "name": "Pumpkin Pie",
      "serves": 4,
      "category": "dessert",
      "ingredients": "flour, sugar, Crisco, pumpkin, eggs, milk, spices",
      "directions": "Make crust, add pumpkin mixture.  Bake.",
      "user_id": 1,
      "editable": true
    },
    {
      "id": 9,
      "name": "Apple Cake",
      "serves": 12,
      "category": "Desserts",
      "ingredients": null,
      "directions": "Make batter, place sliced apples on batter, sprinkle topping over all, bake at 350 for 45 minutes.",
      "user_id": 1,
      "editable": true
    },
    {
      "id": 7,
      "name": "Dutch Apple Pie",
      "serves": 8,
      "category": "Desserts",
      "ingredients": "flour, sugar, Crisco, apples, cinnamon, sugar",
      "directions": "Make bottom crust, place apple mixture in, top with crumb mixture, bake 375 for 45 minutes",
      "user_id": 1,
      "editable": true
    },
    {
      "id": 19,
      "name": "Pot Roast",
      "serves": 6,
      "category": "Desserts",
      "ingredients": null,
      "directions": "Brown roast on all sides in Dutch oven, add beef broth, bring to a boil.  Put lid on Dutch oven, place in oven at 325 degrees for 3 hours.  ",
      "user_id": 1,
      "editable": true
    }
  ]
}
```

#### GET /recipes/1
```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/recipes"
curl "${API}${URL_PATH}/$ID" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```
```sh
TOKEN=BAhJIiU2YjQ0MDNmYTAwYjJhZWVjMTgyMmZjYTdlNTdlMGI2ZQY6BkVG--29964af2634899b453ab75d3f3e6fa080375c7c1 ID=1 sh scripts/get-recipe.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
{
  "recipe": {
    "id": 8,
    "name": "Pumpkin Pie",
    "serves": 4,
    "category": "dessert",
    "ingredients": "flour, sugar, Crisco, pumpkin, eggs, milk, spices",
    "directions": "Make crust, add pumpkin mixture.  Bake.",
    "user_id": 1,
    "editable": true
  }
}
```
#### POST /recipes/
```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/recipes"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "recipe": {
      "name": "'"${NAME}"'",
      "serves": "'"${SERVES}"'",
      "category": "'"${CATEGORY}"'",
      "ingredients": "'"${INGREDIENTS}"'",
      "directions": "'"${DIRECTIONS}"'"
  }'
```
```sh
TOKEN=BAhJIiU2YjQ0MDNmYTAwYjJhZWVjMTgyMmZjYTdlNTdlMGI2ZQY6BkVG--29964af2634899b453ab75d3f3e6fa080375c7c1 NAME="Test Recipe" SERVES=6 CATEGORY=Dessert INGREDIENTS="Test Ingredients" DIRECTIONS="Test Directions" sh scripts/create-recipe.sh
```

Response:

```md
HTTP/1.1 201 Created
Location: http://localhost:4741/recipes/21
Content-Type: application/json; charset=utf-8
{
  "recipe": {
    "id": 21,
    "name": "Test Recipe",
    "serves": 4,
    "category": "dessert",
    "ingredients": "flour, sugar, Crisco, pumpkin, eggs, milk, spices",
    "directions": "Make crust, add pumpkin mixture.  Bake.",
    "user_id": 1,
    "editable": true
  }
}
```
#### PATCH /recipes/1
```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/recipes"
curl "${API}${URL_PATH}/$ID" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "recipe": {
      "name": "'"${NAME}"'",
      "serves": "'"${SERVES}"'",
      "category": "'"${CATEGORY}"'",
      "ingredients": "'"${INGREDIENTS}"'",
      "directions": "'"${DIRECTIONS}"'"
    }
  }'
```
```sh
TOKEN=BAhJIiU2YjQ0MDNmYTAwYjJhZWVjMTgyMmZjYTdlNTdlMGI2ZQY6BkVG--29964af2634899b453ab75d3f3e6fa080375c7c1 ID=21 NAME="Update Recipe" SERVES=8 CATEGORY=Dessert INGREDIENTS="Update Ingredients" DIRECTIONS="Update Directions" sh scripts/update-recipe.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
{
  "recipe": {
    "id": 21,
    "name": "Update Recipe",
    "serves": 8,
    "category": "Dessert",
    "ingredients": "Update Ingredients",
    "directions": "Update Directions",
    "user_id": 1,
    "editable": true
  }
}
```
#### DELETE /recipes/1
```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/recipes"
curl "${API}${URL_PATH}/$ID" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```
```sh
TOKEN=BAhJIiU2YjQ0MDNmYTAwYjJhZWVjMTgyMmZjYTdlNTdlMGI2ZQY6BkVG--29964af2634899b453ab75d3f3e6fa080375c7c1 ID=21 sh scripts/delete-recipe.sh
```

Response:

```md
HTTP/1.1 204 No Content
```
### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```
