"""Tests for the hello_world component."""

import sys
from pathlib import Path

import pytest

# Add parent directory to path to import component
sys.path.insert(0, str(Path(__file__).parent.parent))

from component import hello_world


def test_hello_world_default():
    """Test hello_world with default parameter."""
    # Access the underlying Python function from the component
    result = hello_world.python_func()
    assert result == "Hello, World!"


def test_hello_world_custom_name():
    """Test hello_world with custom name."""
    result = hello_world.python_func(name="Kubeflow")
    assert result == "Hello, Kubeflow!"


def test_hello_world_empty_string():
    """Test hello_world with empty string."""
    result = hello_world.python_func(name="")
    assert result == "Hello, !"


def test_hello_world_special_characters():
    """Test hello_world with special characters in name."""
    result = hello_world.python_func(name="Test-User_123")
    assert result == "Hello, Test-User_123!"

