#!/bin/sh

# path:   /home/klassiker/.local/share/repos/notes/build.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/notes
# date:   2022-08-25T15:31:16+0200

# config
notes="$HOME/.local/share/repos/notes"
destination_path="/srv/http/notes/"

# help
script=$(basename "$0")
help="$script [-h/--help] -- script to build notes with pandoc and sync to webserver
  Usage:
    $script [hostname1] [hostname2] [hostname3]

  Settings:
    without given hostname, only build the notes with pandoc
    [hostnameN] = Hostnames to rsync data with

  Examples:
    $script
    $script pi
    $script pi pi2

  Config:
    notes            = $notes
    destination_path = $destination_path"

convert() {
    printf ":: Converting to HTML...\n"
    pandoc \
        "$notes"/*.md \
        --from markdown \
        --to html5 \
        --output "$notes/index.html" \
        --data-dir="$notes/" \
        --standalone \
        --table-of-contents \
        --include-in-header "$notes/template/header.html" \
        --metadata pagetitle="Notes"
}

copy() {
    for webserver in "$@"; do
        printf ":: Copy to %s...\n" \
            "$webserver"
        if ping -c1 -W1 -q "$webserver" >/dev/null 2>&1; then
            rsync \
                --info=progress2 \
                --delete \
                -acLh "$notes/" \
                "$webserver":"$destination_path"
        else
            printf ":: Cannot copy files, %s is not available!\n" \
                "$webserver"
        fi
    done
}

case "$1" in
    -h | --help)
        printf "%s\n" "$help"
        ;;
    *)
        convert
        copy "$@"
        ;;
esac
