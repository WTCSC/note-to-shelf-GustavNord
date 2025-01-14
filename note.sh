#!/bin/bash
NOTES_TXT=notes.txt

function add() {
    local note="$1"
    echo "Your note text here: $1"
    modified_note="$(date +"%Y-%m-%d %H:%M:%S") - $1"
    echo "$modified_note" >> /notes.txt
}



function list() {
   # if $NOTES_TXT empty, then echo error and return 1 and fi for finished


    echo $NOTES_TXT
}



function search() {

}