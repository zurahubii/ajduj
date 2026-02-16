#!/bin/bash

# Read the file line by line
while IFS='=' read -r key value; do
    # Skip comments and empty lines
    if [[ "$key" =~ ^#.* ]] || [[ -z "$key" ]]; then
        continue
    fi

    # Remove potential quotes from the value
    value=$(echo "$value" | sed -e 's/^"//' -e 's/"$//')

    echo "Processing: $key with value: $value"
    # *** DO SOMETHING WITH THE KEY AND VALUE HERE ***
    # Example: run a command with the value
    # my_command --$key="$value"
    gh secret set $key --body $value
done < .env