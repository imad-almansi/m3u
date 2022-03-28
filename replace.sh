#!/bin/bash

URL=$(curl 'https://ticket.roya.tv/api/livestream/ticket' \
  -H 'authority: ticket.roya.tv' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="99", "Google Chrome";v="99"' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'dnt: 1' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36' \
  -H 'sec-ch-ua-platform: "Linux"' \
  -H 'origin: https://roya.tv' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-dest: empty' \
  -H 'referer: https://roya.tv/' | jq -r '.data.secured_url')

sed -i "/roya-live/c$URL" Imad.m3u

git config user.name "imad-almansi"
git config user.email "imadalmansi@yahoo.com"
git add -A
git commit -m "replace url"
git push
