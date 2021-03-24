#!/usr/bin/env bash
word=$(xclip -o)
res=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")
regex=$'"definition":"\K(.*?)(?=")'
definitions=$(echo $res | grep -Po "$regex")
separatedDefinition=$(sed ':a;N;$!ba;s/\n/\n\n/g' <<< "$definitions")
notify-send -u low -t 100000 "$word" "$separatedDefinition"
