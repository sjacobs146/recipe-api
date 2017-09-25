#!/bin/bash

# TOKEN=BAhJIiU1YzI2MmEyM2UxMjE0NmRjZThmZjJlMWJjYzYzMjMyZgY6BkVG--02a11f2b646b0a2794ea4d5ff4a248e086ab3597 NAME="Chocolate Cake" sh scripts/create-recipe.sh

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
      "ingredients": "flour, sugar, eggs, baking soda",
      "directions": "mix and bake"
    }
  }'

echo
