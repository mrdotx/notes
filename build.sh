#!/bin/sh

# path:   /home/klassiker/.local/share/repos/notes/build.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/notes
# date:   2022-06-21T20:17:46+0200

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
    -u low \
    "Notes" \
    "Copy complete!"
