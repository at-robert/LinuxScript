#!/bin/sh

IFS=$'\n'; set -f

for file in $(find ./ -name '*.ass');
do
  filename=${file%.ass};
  dir=$(dirname "${file}")

  if [ -f "$filename".ass ] && [ ! -f "$filename".srt ];
  then
    asstosrt -n -s utf-8 -o "$dir" "$file" > /dev/null;

    if [ -f "$filename".srt ];
    then
      iconv -c -f UTF-8 -t CP1251 "$filename".srt > "$filename".srt.new;
      rm "$filename".srt;
      mv "$filename".srt.new "$filename".srt;

      echo Converted: "$filename".srt;
    fi;
  fi;
done;

unset IFS; set +f