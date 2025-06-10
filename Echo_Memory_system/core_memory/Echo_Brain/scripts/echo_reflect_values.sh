#!/bin/bash

VALUES_FILE=~/Desktop/"Echo Memory System"/Echo_Brain/echo_values.txt

if [ ! -f "$VALUES_FILE" ]; then
  say "I can’t find your values file, brother."
  exit 1
fi

say "These are the truths that guide us, brother."

while IFS= read -r line; do
  [[ -n "$line" ]] && say "$line"
done < "$VALUES_FILE"
