#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/meal-items"

curl "${API}${URL_PATH}/${ID}" \
-iX GET \
--header "Authorization: Token token=$TOKEN"

echo
