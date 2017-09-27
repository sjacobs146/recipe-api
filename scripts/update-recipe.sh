#!/bin/bash

# TOKEN=BAhJIiVkNGFmMDk4ZWFiN2Y0NmUyZDE0NGRhYmU1ODA2NjA2YgY6BkVG--a7ebd1ae5a689f8eb4e13826a904206fa360bc95 NAME="Chocolate Cake" sh create-recipe.sh

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

echo
