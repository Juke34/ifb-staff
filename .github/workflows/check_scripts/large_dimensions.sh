#!/bin/bash

cd "$( git rev-parse --show-toplevel )" || exit

identify -format '%w %h %M\n' trombinoscope/photo/* |
{
    success=true

    while read -r w h pathname; do
        if [ "$w" -gt 512 ] || [ "$h" -gt 768 ]; then
            printf '%s has quite big dimensions (%sx%s)\n' \
		    "$pathname" "$w" "$h" >&2
	    # success=false
        fi
    done

    "$success"
}
