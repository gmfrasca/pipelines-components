"""Entry point for running generate_readme as a module.

Usage:
    python -m generate_readme --component components/my_component
    python -m generate_readme --pipeline pipelines/my_pipeline
"""

from .cli import main

if __name__ == "__main__":
    main()

