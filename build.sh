#!/bin/sh

# path:       ~/repos/notes/build.sh
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/notes
# date:       2020-02-28T08:15:08+0100

notes=$HOME/repos/notes

# copy to webserver
printf ":: Converting to HTML...\n"

pandoc "$notes"/*.md -s --toc -H "$notes"/template/header.html --metadata pagetitle="Notes" --data-dir="$notes"/ -f markdown -t html5 -o "$notes"/index.html

printf ":: HTML build\n"
#printf ":: Copy to hermes...\n"
#rsync --info=progress2 --delete -ac --exclude="*.md" --exclude="*.sh" --exclude="template" "$notes"/ alarm@hermes:/srv/http/notes/

#printf ":: Copy to prometheus...\n"
#rsync --info=progress2 --delete -ac --exclude="*.md" --exclude="*.sh" --exclude="template" "$notes"/ alarm@prometheus:/srv/http/notes/

#printf ":: Copy completed!\n"
printf ":: Build complete!\n"

notify-send "Notes" "Build complete!" --icon=messagebox_info
