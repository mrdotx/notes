#!/bin/sh

# path:       ~/repos/build.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/vimwiki-pandoc
# date:       2020-03-15T12:22:44+0100

notes="$HOME/repos/notes"

# convert markdowns to html
printf ":: Converting to HTML...\n"
pandoc "$notes"/*.md -s --toc -H "$notes"/template/header.html --metadata pagetitle="Notes" --data-dir="$notes"/ -f markdown -t html5 -o "$notes"/index.html

# copy to webservers
printf "%s\n" ":: Copy to hermes..."
if ping -c1 -W1 -q hermes >/dev/null 2>&1; then
    rsync --info=progress2 --delete -acL "$notes"/ alarm@hermes:/srv/http/notes/
else
    printf "%\n" ":: Can not copy files, hermes is not available!"
fi

printf "%s\n" ":: Copy to prometheus..."
if ping -c1 -W1 -q prometheus >/dev/null 2>&1; then
    rsync --info=progress2 --delete -acL "$notes"/ alarm@prometheus:/srv/http/notes/
else
    printf "%s\n" ":: Can not copy files, prometheus is not available!"
fi

printf "%s\n" ":: Copy completed!"
notify-send "Notes" "Copy complete!" --icon=messagebox_info
