#!/bin/bash

templates_dir="templates"
output_dir="output"

# Check if the templates directory exists
if [ ! -d "$templates_dir" ]; then
    echo "Error: The 'templates' directory does not exist. Please create the 'templates' directory and place your templates there."
    exit 1
fi

# Check if the output directory exists, if not, create it
if [ ! -d "$output_dir" ]; then
    mkdir "$output_dir"
fi

# Prompt user for the template type
echo "Available template types:"
ls "$templates_dir"
echo -n "Enter the name of the template you want to use: "
read template_name

# Check if the selected template exists
if [ ! -f "$templates_dir/$template_name" ]; then
    echo "Error: The specified template does not exist in the 'templates' directory."
    exit 1
fi

# Prompt user for the number of files to create
echo -n "Enter the number of files you want to create: "
read num_files

# Create the files from the selected template
for ((i = 1; i <= num_files; i++)); do
    cp "$templates_dir/$template_name" "$output_dir/${template_name}_file$i"
done

echo "Files created successfully in the 'output' directory."
