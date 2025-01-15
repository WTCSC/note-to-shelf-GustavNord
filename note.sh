#!/bin/bash
NOTES_TXT=notes.txt

function add() {
    local note="$1"
    echo "Note added successfully"
    modified_note="$(date +"%Y-%m-%d %H:%M:%S") - $1"
    echo "$modified_note" >> notes.txt
    exit 0
}



function list() {
    if [ ! -f "notes.txt" ]; then
        echo "Error"
        exit 1
    else
        cat $NOTES_TXT
    fi
}   



function search() {
    local search_word="$2"
    grep -i "$search_word" notes.txt
}

function clear() {
    > notes.txt
}


case "$1" in
    add) add "$2" ;;
    list) list ;;
    search) search ;;
    clear) clear ;;
    *) echo "Invalid command"; exit 1 ;;
esac