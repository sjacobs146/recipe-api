API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/recipes"
curl "${API}${URL_PATH}/$ID" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"

echo
