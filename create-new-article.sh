#!/bin/bash

templates_dir="templates"

# Check if the templates directory exists
if [ ! -d "$templates_dir" ]; then
    echo "Error: The 'templates' directory does not exist. Please create the 'templates' directory and place your templates there."
    exit 1
fi

# List available template types and prompt user for the template number
echo "Available template types:"
num=1
for template in "$templates_dir"/*; do
    echo "$num. $(basename "$template")"
    ((num++))
done

echo -n "Enter the number of the template you want to use: "
read template_num

# Validate the input template number
if ! [[ "$template_num" =~ ^[0-9]+$ ]]; then
    echo "Error: Invalid input. Please enter a valid number."
    exit 1
fi

template_array=("$templates_dir"/*)

if ((template_num < 1 || template_num > ${#template_array[@]})); then
    echo "Error: Invalid template number. Please select a number from the list."
    exit 1
fi

# Prompt user for the output directory
echo -n "Enter the name of the output directory (press Enter for default 'output' directory): "
read custom_output_dir

selected_template="${template_array[$((template_num - 1))]}"

# Set the output directory to the default 'output' directory if not provided
if [ -z "$custom_output_dir" ]; then
    output_dir="output"
else
    output_dir="$custom_output_dir"
fi

# Check if the output directory exists, if not, create it
if [ ! -d "$output_dir" ]; then
    mkdir "$output_dir"
fi

cp "$selected_template" "$output_dir/$(basename "$selected_template")"

echo "Files created successfully in the '$output_dir' directory."
