"""Tests for the hello_world pipeline."""

import sys
from pathlib import Path

import pytest

# Add parent directory to path to import pipeline
sys.path.insert(0, str(Path(__file__).parent.parent))

from pipeline import hello_world_pipeline


def test_hello_world_pipeline_exists():
    """Test that the pipeline function exists and is callable."""
    assert callable(hello_world_pipeline)


def test_hello_world_pipeline_has_correct_name():
    """Test that the pipeline has the correct name."""
    assert hello_world_pipeline.name == 'hello-world-pipeline'


def test_hello_world_pipeline_has_description():
    """Test that the pipeline has a description."""
    assert hello_world_pipeline.description
    assert 'hello world' in hello_world_pipeline.description.lower()


def test_hello_world_pipeline_parameters():
    """Test that the pipeline has the expected parameters."""
    # Get the pipeline spec to inspect parameters
    import inspect
    sig = inspect.signature(hello_world_pipeline.python_func)
    
    # Check that expected parameters exist
    assert 'name' in sig.parameters
    assert 'greeting_prefix' in sig.parameters
    
    # Check default values
    assert sig.parameters['name'].default == "Kubeflow"
    assert sig.parameters['greeting_prefix'].default == "Hello"


def test_hello_world_pipeline_return_annotation():
    """Test that the pipeline has a return annotation."""
    import inspect
    sig = inspect.signature(hello_world_pipeline.python_func)
    assert sig.return_annotation == str

