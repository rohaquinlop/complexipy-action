#!/bin/sh -l

paths=$(echo $1 | tr '\n' ' ')

max_complexity_allowed=""
if [ -n "$2" ]; then
    max_complexity_allowed="-mx $2"
fi

quiet=""
if [ "$3" = "true" ]; then
    quiet="-q"
fi

ignore_complexity=""
if [ "$4" = "true" ]; then
    ignore_complexity="-i"
fi

failed=""
if [ "$5" = "true" ]; then
    failed="-f"
fi

sort=""
if [ "$6" = "asc" ]; then
    sort="-s asc"
elif [ "$6" = "desc" ]; then
    sort="-s desc"
elif [ "$6" = "file_name" ]; then
    sort="-s file_name"
fi

output_csv=""
if [ "$7" = "true" ]; then
    output_csv="-c"
fi

output_json=""
if [ "$8" = "true" ]; then
    output_json="-j"
fi

exclude=""
if [ -n "${9}" ]; then
    for dir in ${9}; do
        exclude="$exclude -e $dir"
    done
fi

complexipy $paths $max_complexity_allowed $quiet $ignore_complexity $failed $sort $output_csv $output_json $exclude