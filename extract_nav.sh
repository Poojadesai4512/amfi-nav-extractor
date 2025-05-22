#!/bin/bash

# Define URL and output file
URL="https://www.amfiindia.com/spages/NAVAll.txt"
OUTPUT="scheme_asset.tsv"

# Download the file
curl -s "$URL" -o nav.txt

# Extract Scheme Name and Asset Value
awk -F ';' 'NF > 5 && $4 ~ /^[0-9]+(\.[0-9]+)?$/ { print $3 "\t" $4 }' nav.txt > "$OUTPUT"

echo "Extraction complete. Output saved to $OUTPUT"
