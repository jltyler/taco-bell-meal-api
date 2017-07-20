#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meal_items"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "meal_item": {
      "meal_id": "'"${MEAL}"'",
      "menu_item_id": "'"${ITEM}"'"
    }
  }'

echo
