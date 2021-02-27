emoji_html=$(curl "https://japaneseemoticons.me/all-japanese-emoticons/")

cat $emoji_html

# pup 'a.ct5Ked json{}' | jq -r '.[] | .title' |:w

