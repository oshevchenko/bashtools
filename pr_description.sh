#!/bin/sh
pwd
echo ">>>>>>"

git log --oneline --decorate | awk '{print $1;}' | \
    xargs -I % sh -c \
    " \
    printf '* ' && git show % | sed -n '5p' | sed -e 's/^[[:space:]]*//' ; \
    git show % | grep '    Issue:' | sed -n '1p' \
    "
