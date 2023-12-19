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
        # Check that filename extension is not .yaml
        if [[ $pathname == *.yaml ]]; then
            printf 'Expecting .yml extension, not .yaml: %s\n' \
		    "$pathname" >&2
            success=false
        fi
    done

    "$success"
}
