#!/bin/bash

# Define the file where the notes will be stored.
NOTES_TXT="notes.txt"

# Adds a function to add a new note.
function add() {
    # Stores the note text passed as the first argument.
    local note="$1"
    # Checks to see if the note.txt is empty.
    if [[ -z "$note" ]]; then
        echo "Error: Note text cannot be empty."
        exit 1
    fi

    # Gets the current time and date and stores it in a variable named time.
    local time=$(date +"%Y-%m-%d %H:%M:%S")
    # Adds the note with the time, date, and the note to the note.txt file. 
    echo "$time - $note" >> "$NOTES_TXT"
    # Echos that the note has been successfully added.
    echo "Note added successfully"
}

# Adds a function to list all the saved notes in notes.txt.
function list() {
    # Checks if the notes file has something in it.
    if [[ ! -f "$NOTES_TXT" || ! -s "$NOTES_TXT" ]]; then
        # If not, it echos error and exits. 
        echo "Error: No notes found"
        exit 1
    fi
    # Otherwise, it prints the list.
    cat "$NOTES_TXT"
}   

# Adds a function to search for a specific note
function search() {
    # Checks if the notes file exists. 
    if [[ ! -f "$NOTES_TXT" ]]; then
        # If not, echo error and exits.
        echo "Error: Notes file not found."
        exit 1
    fi

    # Gets the search word from the first argument.
    local search_word="$1"
    # Checks if the search word is actual words.
    if [[ -z "$search_word" ]]; then
        # If not, it echos error and exits.
        echo "Error: Search keyword cannot be empty."
        exit 1
    fi

    # Searches for the search word in the notes.txt file and is not case sensitive. If no match, echo "No matching notes found."
    grep -i "$search_word" "$NOTES_TXT" || echo "No matching notes found."
}
# Adds a function to clear the notes.txt file.
function clear() {
    # Empties the notes.txt file.
    > notes.txt
}

# Main case statements used to process the command-line inputs/arguments.
case "$1" in
    # Calls the add function if the command is "add."
    add) add "$2" ;;
    # Calls the list function if the command is "list."
    list) list ;;
    # Calls the search function if the command is "search."
    search) search "$2" ;;
    # Calls the clear function if the command is "clear."
    clear) clear ;;
    # Takes care of invalid commands
    *) 
        # Echos invalid command and shows options
        echo "Invalid command. Usage: $0 {add|list|search|clear} [arguments]" 
        exit 1 
        ;;
esac
