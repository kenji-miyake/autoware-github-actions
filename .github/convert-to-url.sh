#!/bin/bash
# Convert formatted input to URL for reusable-sync-files.yaml
# Usage: convert-to-url.sh <repo@version: file_path>

set -e

# Parse arguments
args=()
while [ "${1:-}" != "" ]; do
    case "$1" in
    *)
        args+=("$1")
        ;;
    esac
    shift
done

formatted_input="${args[0]}"

# Check args
if [ "$formatted_input" = "" ]; then
    echo -e "\e[31mPlease input a valid formatted_input as the 1st argument.\e[m"
    exit 1
fi

# Parse input
pattern="(.*)@(.*):\s*(.*)"
repository=$(echo "$formatted_input" | sed -r "s/$pattern/\1/")
version=$(echo "$formatted_input" | sed -r "s/$pattern/\2/")
file_path=$(echo "$formatted_input" | sed -r "s/$pattern/\3/")

# Output
echo "$repository" "$version" "$file_path"
