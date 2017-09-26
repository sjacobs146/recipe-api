#!/bin/bash

# TOKEN=BAhJIiUwNDI1NGY1ODBhMzI1NzFhMTQwNjMzYjkyOTU4YjFlZAY6BkVG--5c14eec9d49c03ccebbf9bf0a248cf33f3db05b7 NAME="Pumpkin Pie" sh scripts/create-recipe.sh

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
