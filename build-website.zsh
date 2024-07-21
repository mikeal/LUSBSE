#!/bin/zsh

# Function to convert markdown files to HTML
convert_md_to_html() {
    local input_file=$1
    local output_file=$2
    pandoc "$input_file" -o "$output_file" --css="../translation.css"
}

# Create website directory if it does not exist
mkdir -p website/sutras

# Convert all markdown files in sutras directory to HTML
for md_file in $(find sutras -name '*.md'); do
    html_file="website/${md_file%.md}.html"
    mkdir -p $(dirname "$html_file")
    convert_md_to_html "$md_file" "$html_file"
done

# Convert README.md to index.html
convert_md_to_html "README.md" "website/index.html"

echo "Website generation complete!"
