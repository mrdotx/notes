#!/bin/sh

# path:   /home/klassiker/.local/share/repos/notes/build.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/notes
# date:   2022-01-14T13:54:37+0100

notes="$HOME/.local/share/repos/notes"

# convert markdowns to html
printf ":: Converting to HTML...\n"
pandoc "$notes"/*.md -s --toc -H "$notes/template/header.html" --metadata pagetitle="Notes" --data-dir="$notes/" -f markdown -t html5 -o "$notes/index.html"

# copy to webservers
printf "%s\n" ":: Copy to pi..."
if ping -c1 -W1 -q pi >/dev/null 2>&1; then
    rsync --info=progress2 --delete -acLh "$notes/" pi:/srv/http/notes/
else
    printf "%\n" ":: Can not copy files, pi is not available!"
fi

printf "%s\n" ":: Copy to pi2..."
if ping -c1 -W1 -q pi2 >/dev/null 2>&1; then
    rsync --info=progress2 --delete -acLh "$notes/" pi2:/srv/http/notes/
else
    printf "%s\n" ":: Can not copy files, pi2 is not available!"
fi

printf "%s\n" ":: Copy completed!"
notify-send \
    "Notes" \
    "Copy complete!"
