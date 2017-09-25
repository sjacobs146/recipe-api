#!/bin/bash

# TOKEN=BAhJIiU2MTc3YjU4MDNkZmJjZTU4MTIxMzYyNmI0NjFjOWFjYgY6BkVG--0b302be94242ef193a23b0e13f029c097d04d0d2 NAME="Pumpkin Pie" sh scripts/create-recipe.sh

API="${API_ORIGIN:-http://localhost:4741}"
# API="${API_ORIGIN:-https://sjacobs146-recipe-api.herokuapp.com}"
URL_PATH="/recipes"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "recipe": {
      "name": "'"${NAME}"'",
      "serves": 4,
      "category": "dessert",
      "ingredients": "flour, sugar, Crisco, pumpkin, eggs, milk, spices",
      "directions": "Make crust, add pumpkin mixture.  Bake."
    }
  }'

echo
