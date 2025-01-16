# Note to Shelf
This code is a command-line tool for taking and managing notes from the terminal. Users are able to add, see the list, search for keywords, and clear notes. Each new note taken has a time stamp and date for better organization.

## Features
Add notes (with timestamps) that are stored in a separate text file. 

List all notes, showing them and their timestamps.

Search for notes using keywords (not case sensative).

Clear all notes from the text file.

Handles errors for invalid inputs or empty files.

Exit codes for both success and failure.

## How it works
When adding notes, the script appends said note to the `notes.txt` file with a timestamp.

When listing the notes, the script will read and output the notes of `notes.txt` file if it's not empty.

When searching for notes, the script will search for inputted keyword in the `notes.txt` file and output any matching notes.

When clearing the notes, the script will clear the `notes.txt` file.

## Requirements
Bash shell

File Handling

Date Command

## End of README
This `README.md` is a detailed guide on the features, behavior, and requirements for the note-taking tool `note.sh`. 
