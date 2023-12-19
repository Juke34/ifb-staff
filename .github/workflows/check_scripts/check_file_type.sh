#!/bin/bash

cd "$( git rev-parse --show-toplevel )" || exit

git fetch -q --no-tags --prune --depth=1 origin main

git diff --name-only -z HEAD origin/main -- |
{
    success=true

    while IFS= read -r -d '' pathname; do
        # Skip deleted files
        if [ ! -e "$pathname" ]; then
            continue
        fi
        # Ignore the .github directory
        if [[ $pathname == .github/* ]]; then
            continue
        fi
        # Check that filename extension is not .yml
        if [[ $pathname == *.yml ]]; then
            printf 'Expecting .yaml extension, not .yml: %s\n' \
		    "$pathname" >&2
            success=false
        fi
    done

    "$success"
}
