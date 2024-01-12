#!/bin/bash

cd "$( git rev-parse --show-toplevel )" || exit

stat -c '%s %n' trombinoscope/photo/* |
{
    success=true

    while read -r size pathname; do
        if [ "$size" -gt 262144 ]; then
            printf '%s is a large image file (%s bytes)\n' \
		    "$pathname" "$size"
	        #success=false
        fi
    done

    "$success"
}
