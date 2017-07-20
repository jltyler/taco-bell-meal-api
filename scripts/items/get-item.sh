#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/menu_items"

curl "${API}${URL_PATH}/${ID}" \
-iX GET

echo
