"""Hello World Pipeline for Kubeflow Pipelines."""

from kfp import dsl

# Import the hello_world component
import sys
from pathlib import Path
from typing import Optional, Union
# sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent.parent / 'components'))
from components.dev.hello_world.component import hello_world


@dsl.pipeline(
    name='hello-world-pipeline',
    description='A simple hello world pipeline that demonstrates basic KFP pipeline structure'
)
def hello_world_pipeline(
    name: str = "Kubeflow",
    greeting_prefix: str = "Hello",
    
) -> str:
    """A simple hello world pipeline.
    
    This pipeline demonstrates how to create a basic Kubeflow Pipeline
    that uses the hello_world component.
    
    Args:
        name: The name to greet. Defaults to "Kubeflow".
        greeting_prefix: The greeting prefix. Defaults to "Hello".
        foo_union: A union of int and str. Defaults to 1.
        
    Returns:
        The greeting message from the hello_world component.
    """
    # Use the hello_world component
    hello_task = hello_world(name=name)
    
    # Return the output
    return hello_task.output

