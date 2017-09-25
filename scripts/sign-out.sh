#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
/API="${API_ORIGIN:-https://sjacobs146-recipe-api.herokuapp.com}"
URL_PATH="/sign-out"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
