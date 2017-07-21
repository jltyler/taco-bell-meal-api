#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/delete-item"

curl "${API}${URL_PATH}/${ID}" \
-iX DELETE \
--header "Content-Type: application/json" \
--header "Authorization: Token token=$TOKEN" \
--data '{
  "meal": {
    "menu_item_id": "'"${ITEM}"'"
  }
}'

echo
