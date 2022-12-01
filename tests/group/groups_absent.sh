#!/bin/bash

NUM=1000
FILE="groups_absent.json"

echo "{" > "$FILE"

echo "  \"groups\": [" >> "$FILE"

for i in $(seq 1 "$NUM"); do
    echo "    {" >> "$FILE"
    echo "      \"name\": \"group$i\"," >> "$FILE"
    if [ "$i" -lt "$NUM" ]; then
       echo "    }," >> "$FILE"
    else
       echo "    }" >> "$FILE"
    fi
done

echo "  ]" >> "$FILE"

echo "}" >> "$FILE"
