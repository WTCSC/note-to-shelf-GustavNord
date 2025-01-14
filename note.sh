#!/bin/bash
NOTES_TXT=notes.txt

function add() {
    local note="$1"
    echo "Your note text here: $1"
    modified_note="$(date +"%Y-%m-%d %H:%M:%S") - $1"
    echo "$modified_note" >> /notes.txt
}



function list() {
    echo $NOTES_TXT
}



function search() {

}