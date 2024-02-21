#!/bin/bash

# The root directory of your dotfiles repository
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# The target directory where the symlinks will be created (typically the home directory)
TARGET_DIR="$HOME"

# Array of paths to exclude from symlinking, relative to DOTFILES_DIR
declare -a EXCLUDE_PATHS=("install.sh" "README.md" ".git")

# Function to check if the path is excluded
is_excluded() {
    local path="$1"
    for exclude in "${EXCLUDE_PATHS[@]}"; do
        if [[ "$path" == *"$exclude"* ]]; then
            return 0 # 0 means true in bash script exit codes
        fi
    done
    return 1 # False, the path is not excluded
}

# Function to install dotfiles
install_dotfiles() {
    local src_dir="$1"
    local target_dir="$2"
    
    # Find all files in the source directory
    find "$src_dir" -type f | while IFS= read -r src; do
        # Check if the file should be excluded
        if is_excluded "$src"; then
            echo "Excluding $src"
            continue
        fi

        # Make shell scripts executable
        if [[ "$src" == *.sh ]]; then
            chmod +x "$src"
            echo "Set executable permission for $src"
        fi

        # Construct the target path
        local target="$target_dir/${src#$DOTFILES_DIR/}"

        # Create the target directory if it doesn't exist
        mkdir -p "$(dirname "$target")"

        # # Create the symlink, overwriting any existing file/symlink
        # ln -sf "$src" "$target"
        # echo "Created symlink for $src at $target"

        # Copy dotfiles, overwriting any existing file
        cp -rf "$src" "$target"
        echo "Copied dotfiles for $src at $target"
    done
}

install_dotfiles "$DOTFILES_DIR" "$TARGET_DIR"

echo "Dotfiles have been installed."
