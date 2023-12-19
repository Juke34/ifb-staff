#!/bin/bash

cd "$( git rev-parse --show-toplevel )" || exit

awk '/^[[:blank:]]*image: / {
    imgpath = FILENAME
    sub("[^/]*$", "img/" $2, imgpath)
    print FILENAME, imgpath
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
