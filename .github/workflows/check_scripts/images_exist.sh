#!/bin/bash

cd "$( git rev-parse --show-toplevel )" || exit

awk '/^[[:blank:]]*image: / {
    print FILENAME, "img/"$2
}' staff/*.yaml |
{
    success=true

    while read -r ymlfile imgfile; do
        if [[ $ymlfile == *TEMPLATE* ]]; then
            continue
        fi
        if [ ! -e "$imgfile" ]; then
            printf '%s (from %s) does not exist\n' \
		    "$imgfile" "$ymlfile" >&2
            success=false
        fi
    done

    "$success"
}
