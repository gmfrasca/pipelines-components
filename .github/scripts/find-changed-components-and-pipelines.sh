#!/bin/bash
# Extract unique component and pipeline directories from a list of changed files
# Usage: ./find-changed-components-and-pipelines.sh <file1> <file2> ...
# Output: Space-separated list of directories

set -e

components=""
pipelines=""

for file in "$@"; do
    # Check if file is in components directory
    if [[ "$file" == components/*/* ]]; then
        # Extract component directory (e.g., components/hello_world)
        comp_dir=$(echo "$file" | cut -d'/' -f1-2)
        if [[ ! " $components " =~ " $comp_dir " ]]; then
            components="$components $comp_dir"
        fi
    fi
    
    # Check if file is in third_party/components directory
    if [[ "$file" == third_party/components/*/* ]]; then
        # Extract component directory (e.g., third_party/components/hello_world)
        comp_dir=$(echo "$file" | cut -d'/' -f1-3)
        if [[ ! " $components " =~ " $comp_dir " ]]; then
            components="$components $comp_dir"
        fi
    fi
    
    # Check if file is in pipelines directory
    if [[ "$file" == pipelines/*/* ]]; then
        # Extract pipeline directory (e.g., pipelines/hello_world)
        pipe_dir=$(echo "$file" | cut -d'/' -f1-2)
        if [[ ! " $pipelines " =~ " $pipe_dir " ]]; then
            pipelines="$pipelines $pipe_dir"
        fi
    fi
    
    # Check if file is in third_party/pipelines directory
    if [[ "$file" == third_party/pipelines/*/* ]]; then
        # Extract pipeline directory (e.g., third_party/pipelines/hello_world)
        pipe_dir=$(echo "$file" | cut -d'/' -f1-3)
        if [[ ! " $pipelines " =~ " $pipe_dir " ]]; then
            pipelines="$pipelines $pipe_dir"
        fi
    fi
done

# Trim whitespace and output
all_targets="$(echo "$components $pipelines" | xargs)"
echo "$all_targets"

