#!/bin/bash
NEW_FILE=/path/to/new_file   #temporarily stores latest entry
MAIN_FILE=/path/to/main_file #stores all entries

#checks if newest-entry.md exists
if [ -f "$NEW_FILE" ]; then
	echo -e "\n\n" >> "$MAIN_FILE"    #adds a line between entries
	cat "$NEW_FILE" >> "$MAIN_FILE"   #appends new entry

	#deletes newest-entry.md
	rm "$NEW_FILE"
fi

#creates new file
touch "$NEW_FILE"

#adds the date as the heading
echo -e "#$(date +"%A, %b %d, %Y %H:%M:%S")" >> "$NEW_FILE"

#opens the file using Remarkable
#can be modified to open in a different Markdown editor
remarkable "$NEW_FILE"

