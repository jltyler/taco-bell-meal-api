#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meals"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "meal": {
      "name": "'"${TEXT}"'",
      "user_id": "'"${USER}"'"
    }
  }'

echo
