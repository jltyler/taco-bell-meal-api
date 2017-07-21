#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/add-item"

curl "${API}${URL_PATH}/${ID}" \
-iX POST \
--header "Content-Type: application/json" \
--header "Authorization: Token token=$TOKEN" \
--data '{
  "meal": {
    "menu_item_id": "'"${ITEM}"'"
  }
}'

echo
