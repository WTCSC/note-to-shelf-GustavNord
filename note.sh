#!/bin/bash
NOTES_TXT="notes.txt"

function add() {
    local note="$1"
    if [[ -z "$note" ]]; then
        echo "Error: Note text cannot be empty."
        exit 1
    fi
    echo "Note added successfully"
    modified_note="$(date +"%Y-%m-%d %H:%M:%S") - $1"
    echo "$modified_note" >> notes.txt
    exit 0
}



function list() {
    if [[ ! -f "$NOTES_TXT" || ! -s "$NOTES_TXT" ]]; then
        echo "Error: No notes found"
        exit 1
    else
        cat $NOTES_TXT
        exit 0
    fi
}   



function search() {
    if [[ ! -f "$NOTES_TXT" ]]; then
        echo "Error: Notes file not found."
        exit 1
    fi
    local search_word="$2"
    if [[ -z "$search_word" ]]; then
        echo "Error: Search keyword cannot be empty."
        exit 1
    fi
    grep -i "$search_word" "$NOTES_TXT" || echo "No matching notes found."
    exit 0
}

function clear() {
    > notes.txt
}


case "$1" in
    add) add "$2" ;;
    list) list ;;
    search) search "$2" ;;
    clear) clear ;;
    *) echo "Invalid command. Usage: $0 {add|list|search|clear} [arguments]" 
    exit 1 
    ;;
esac
