#!/bin/bash
# Extract unique component and pipeline directories from a list of changed files
# Usage: ./find-changed-components-and-pipelines.sh <file1> <file2> ...
# Output: Space-separated list of directories
# Note: If the generator script is changed, returns all components and pipelines

set -e

components=""
pipelines=""
generator_changed=false

# Helper function to find all component directories
# Scans both components/ and third_party/components/
find_all_components() {
    for base_dir in "components" "third_party/components"; do
        if [ -d "$base_dir" ]; then
            for category_dir in "$base_dir"/*/; do
                if [ -d "$category_dir" ]; then
                    for comp_dir in "$category_dir"*/; do
                        if [ -d "$comp_dir" ] && [ -f "${comp_dir}component.py" ]; then
                            comp_path="${comp_dir%/}"
                            components="$components $comp_path"
                        fi
                    done
                fi
            done
        fi
    done
}

# Helper function to find all pipeline directories
# Scans both pipelines/ and third_party/pipelines/
find_all_pipelines() {
    for base_dir in "pipelines" "third_party/pipelines"; do
        if [ -d "$base_dir" ]; then
            for category_dir in "$base_dir"/*/; do
                if [ -d "$category_dir" ]; then
                    for pipe_dir in "$category_dir"*/; do
                        if [ -d "$pipe_dir" ] && [ -f "${pipe_dir}pipeline.py" ]; then
                            pipe_path="${pipe_dir%/}"
                            pipelines="$pipelines $pipe_path"
                        fi
                    done
                fi
            done
        fi
    done
}

# Helper function to extract directory from file path and add to variable
# Args: $1 = file path, $2 = pattern to match
# Automatically detects third_party prefix, cut depth, and output variable
extract_dir_from_file() {
    local file=$1
    local pattern=$2
    
    if [[ "$file" == $pattern ]]; then
        # Determine output variable based on pattern
        local var_name
        if [[ "$pattern" == *components* ]]; then
            var_name="components"
        elif [[ "$pattern" == *pipelines* ]]; then
            var_name="pipelines"
        else
            return
        fi
        
        # Default to 3 fields, increment by 1 if third_party is in the pattern
        local cut_fields=3
        if [[ "$pattern" == third_party/* ]]; then
            cut_fields=4
        fi
        
        local dir=$(echo "$file" | cut -d'/' -f1-"$cut_fields")
        local current_value
        eval "current_value=\$$var_name"
        if [[ ! " $current_value " =~ " $dir " ]]; then
            eval "$var_name=\"\${$var_name} \${dir}\""
        fi
    fi
}

# Check if the generator script itself was changed
for file in "$@"; do
    if [[ "$file" == scripts/generate_readme/* ]]; then
        generator_changed=true
        break
    fi
done

# If generator changed, find all components and pipelines
if [ "$generator_changed" = true ]; then
    echo "Generator script changed, checking all components and pipelines" >&2
    
    find_all_components
    find_all_pipelines
    
    # Trim whitespace and output
    all_targets="$(echo "$components $pipelines" | xargs)"
    echo "$all_targets"
    exit 0
fi

# Normal operation: extract directories from changed files
for file in "$@"; do
    extract_dir_from_file "$file" "components/*/*/*"
    extract_dir_from_file "$file" "third_party/components/*/*/*"
    extract_dir_from_file "$file" "pipelines/*/*/*"
    extract_dir_from_file "$file" "third_party/pipelines/*/*/*"
done

# Trim whitespace and output
all_targets="$(echo "$components $pipelines" | xargs)"
echo "$all_targets"

