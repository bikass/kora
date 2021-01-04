#!/bin/bash
size="$1"
which rsvg-convert > /dev/null 2>&1
if [[ ! $? -eq 0 ]]; then
    echo "rsvg-convert not installed."
    exit 1
elif [[ -z "$size" ]]; then
    echo "Please specify a size."
    exit 1
else
    rm -rf "$size"
    mkdir -p "$size"
    find . -maxdepth 1 -type f -name "*.svg" -print0 | while IFS= read -r -d '' file; do
        if [[ ! -h "$file" ]]; then
            comments=$(grep -o "<!--.*-->" "$file")
            rsvg-convert "$file" -w "$size" -h "$size" -f svg -o "$size/$file"
            sed -i -e "s/<[?]\?xml[^>]*>//g" -e "s/${size}pt/${size}px/g" -e "1s/^/${comments}/" "$size/$file"
        else
            cp -rdf "$file" "$size/"
        fi
    done
fi
