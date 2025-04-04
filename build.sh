#!/bin/sh

# path:   /home/klassiker/.local/share/repos/notes/build.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/notes
# date:   2025-04-04T05:03:37+0200

# config
notes="$HOME/.local/share/repos/notes"
destination_path="/srv/http/notes/"

# color variables
reset="\033[0m"
bold="\033[1m"
blue="\033[94m"
cyan="\033[96m"

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
    printf "%b%b::%b %bconvert to html%b\n" \
        "$bold" "$blue" "$reset" "$bold" "$reset"
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
        printf "%b%b::%b %bcopy to%b %b%s:%s%b\n" \
            "$bold" "$blue" "$reset" "$bold" "$reset" \
            "$cyan" "$webserver" "$destination_path" "$reset"
        if ping -c1 -W1 -q "$webserver" >/dev/null 2>&1; then
            rsync \
                --info=progress2 \
                --delete \
                -acLh "$notes/" \
                "$webserver":"$destination_path"
        else
            printf "cannot copy files, %b%s%b is not available!\n" \
            "$cyan" "$webserver" "$reset"
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
