#!/bin/bash
# Test script to simulate README validation workflow locally
# Usage: ./test-readme-check.sh [--ci] [component_dir|pipeline_dir]
# Requirements: Python with kfp and pyyaml installed
#
# Options:
#   --ci    Run in CI mode (non-interactive, always restore original README on failure)

set -e

# Parse --ci flag
CI_MODE=false
if [ "$1" == "--ci" ]; then
    CI_MODE=true
    shift
fi

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_header() {
    echo "=================================================="
    echo "$1"
    echo "=================================================="
}

# Check dependencies
echo "Checking dependencies..."
if ! python -c "import kfp" 2>/dev/null; then
    print_error "Missing dependency: kfp"
    echo "Install with: pip install kfp"
    exit 1
fi
if ! python -c "import yaml" 2>/dev/null; then
    print_error "Missing dependency: pyyaml"
    echo "Install with: pip install pyyaml"
    exit 1
fi
print_success "Dependencies OK"
echo ""

# Check if target directory is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 [--ci] <component_dir|pipeline_dir>"
    echo ""
    echo "Options:"
    echo "  --ci    Run in CI mode (non-interactive)"
    echo ""
    echo "Examples:"
    echo "  $0 components/hello_world"
    echo "  $0 pipelines/my_pipeline"
    echo "  $0 third_party/components/external_component"
    echo "  $0 --ci components/hello_world  # CI mode"
    exit 1
fi

TARGET_DIR=$1

# Determine if it's a component or pipeline
if [[ "$TARGET_DIR" == components/* ]] || [[ "$TARGET_DIR" == third_party/components/* ]]; then
    TYPE_FLAG="--component"
elif [[ "$TARGET_DIR" == pipelines/* ]] || [[ "$TARGET_DIR" == third_party/pipelines/* ]]; then
    TYPE_FLAG="--pipeline"
else
    print_error "Invalid directory. Must be in components/, pipelines/, third_party/components/, or third_party/pipelines/"
    exit 1
fi

print_header "Testing README validation for: $TARGET_DIR"

# Backup existing README
if [ -f "$TARGET_DIR/README.md" ]; then
    print_warning "Backing up existing README..."
    cp "$TARGET_DIR/README.md" "$TARGET_DIR/README.md.backup"
else
    print_warning "No existing README found"
fi

# Generate new README
echo "Generating README..."
python -m scripts.generate_readme $TYPE_FLAG "$TARGET_DIR" --overwrite

# Compare READMEs (ignore custom content section)
if [ -f "$TARGET_DIR/README.md.backup" ]; then
    echo "Comparing generated README with existing version..."
    
    # Extract content before custom-content marker from both files
    awk '/<!-- custom-content -->/{exit} 1' "$TARGET_DIR/README.md.backup" > /tmp/old_readme.txt
    awk '/<!-- custom-content -->/{exit} 1' "$TARGET_DIR/README.md" > /tmp/new_readme.txt
    
    if ! diff -u /tmp/old_readme.txt /tmp/new_readme.txt; then
        print_error "README is out of sync for $TARGET_DIR"
        echo ""
        echo "The generated README differs from the committed version."
        echo "Command to fix: python -m scripts.generate_readme $TYPE_FLAG $TARGET_DIR --overwrite"
        echo ""
        echo "Diff saved to: /tmp/readme_diff.txt"
        diff -u /tmp/old_readme.txt /tmp/new_readme.txt > /tmp/readme_diff.txt || true
        
        # In CI mode, always restore original README; otherwise ask user
        if [ "$CI_MODE" = true ]; then
            mv "$TARGET_DIR/README.md.backup" "$TARGET_DIR/README.md"
            print_warning "Restored original README (CI mode)"
        else
            # Ask if user wants to keep the new README
            read -p "Keep the newly generated README? (y/N): " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                mv "$TARGET_DIR/README.md.backup" "$TARGET_DIR/README.md"
                print_warning "Restored original README"
            else
                rm "$TARGET_DIR/README.md.backup"
                print_success "Kept new README. Don't forget to commit it!"
            fi
        fi
        
        exit 1
    else
        print_success "README is up-to-date for $TARGET_DIR"
        # Restore backup to maintain custom content
        mv "$TARGET_DIR/README.md.backup" "$TARGET_DIR/README.md"
        exit 0
    fi
else
    print_warning "No existing README to compare against"
    print_success "A new README has been generated. Review and commit it."
    exit 0
fi

