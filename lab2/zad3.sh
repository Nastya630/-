#!/bin/bash

result="result.txt"
exp=".txt"
old="$1"
new="$2"

find . -name "*${exp}" -type f -print0 | while IFS= read -r -d '' file; do
    if grep -q "${old}" $file; then
	sed -i "s/$old/$new/g" "$file"
	echo "$file" >> "${result}"
    fi
    done
