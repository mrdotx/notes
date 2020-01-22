#!/bin/sh

# path:       ~/projects/notes/build.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/notes
# date:       2020-01-22T11:09:59+0100

# color variables
#black=$(tput setaf 0)
#red=$(tput setaf 1)
#green=$(tput setaf 2)
#yellow=$(tput setaf 3)
#blue=$(tput setaf 4)
magenta=$(tput setaf 5)
#cyan=$(tput setaf 6)
#white=$(tput setaf 7)
reset=$(tput sgr0)

notes=$HOME/projects/notes

# copy to webserver
echo "[${magenta}info${reset}] Converting to HTML..."

pandoc "$notes"/*.md -s --toc -H "$notes"/template/header.html --metadata pagetitle="Notes" --data-dir="$notes"/ -f markdown -t html5 -o "$notes"/index.html

echo "[${magenta}info${reset}] HTML build"
#echo "[${magenta}info${reset}] Copy to hermes..."
#rsync --info=progress2 --delete -ac --exclude="*.md" --exclude="*.sh" --exclude="template" "$notes"/ alarm@hermes:/srv/http/notes/

#echo "[${magenta}info${reset}] Copy to prometheus..."
#rsync --info=progress2 --delete -ac --exclude="*.md" --exclude="*.sh" --exclude="template" "$notes"/ alarm@prometheus:/srv/http/notes/

#echo "[${magenta}info${reset}] Copy completed!"
echo "[${magenta}info${reset}] Build complete!"

notify-send "Notes" "Build complete!" --icon=messagebox_info
