#!/bin/bash



input_file="./file.elf"

output_file="./hexout.txt"



xxd -p "$input_file" | sed 's/../0x&, /g' | paste -sd '' | sed 's/, $//' | sed '1s/^/byte[] fileBytes = new byte[] { /; $s/$/ };/;' > "$output_file"



echo "Output written to $output_file"

