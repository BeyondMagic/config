#!/usr/bin/env sh
#
# Just a script to give emails' number left to read :)
# This one is using 4 emails
#
# BeyondMagic © 2021

source "$HOME/desktop/accounts"

affix=""
colour_affix="#F3E7F7"; background="#FFFFFF"


_messages() { while :; do

            first_new_emails=$(curl -u $username_gmail_first:$password_gmail_first --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d')
  first_number_of_new_emails=$(echo "$first_new_emails" | wc -l)

            second_new_emails=$(curl -u $username_gmail_second:$password_gmail_second --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d')
  second_number_of_new_emails=$(echo "$second_new_emails" | wc -l)

            third_new_emails=$(curl -u $username_gmail_third:$password_gmail_third --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d')
  third_number_of_new_emails=$(echo "$third_new_emails" | wc -l)

            fourth_new_emails=$(curl -u $username_gmail_fourth:$password_gmail_fourth --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d')
  fourth_number_of_new_emails=$(echo "$fourth_new_emails" | wc -l)


  # if we have 0 new emails
  [ ! "$first_number_of_new_emails"  = "0" ] ||
  [ ! "$second_number_of_new_emails" = "0" ] ||
  [ ! "$third_number_of_new_emails"  = "0" ] ||
  [ ! "$fourth_number_of_new_emails" = "0" ] && {

    emoji="";
  colour_emoji="#2541E2"; background_emoji="#1C0E2D"; separator="%{F#D4D4D4}:"
  colour="#4946E2"
  number_of_new_emails="%{F${colourof_gmail_first}}$first_number_of_new_emails${separator}%{F${colourof_gmail_second}}$second_number_of_new_emails${separator}%{F${colourof_gmail_third}}$third_number_of_new_emails${separator}%{F${colourof_gmail_fourth}}$fourth_number_of_new_emails"

  # if we have more than 1 email
  } || {

    emoji="﫯";
    colour_emoji="#ABABAB"; background_emoji="#1C0E2D"
    colour="#D4D4D4"
    number_of_new_emails=":("

  }


  echo 'G' "%{O+10 T3 B$background_emoji F$colour_emoji} $emoji %{F$background_emoji B$background}$affix%{T1 B$background F$colour} $number_of_new_emails %{T3 F$background B$colour_affix}$affix"

  sleep 120

done; }

_messages
