"""Example Hello World Component

A simple example component that demonstrates basic Kubeflow Pipelines component structure.
"""

from kfp import dsl

@dsl.component(base_image="python:3.10")
def hello_world(name: str = "World") -> str:
    """A simple hello world component.
    
    Args:
        name: The name to greet. Defaults to "World".
        
    Returns:
        A greeting message.
    """
    message = f"Hello, {name}!"
    print(message)
    return message

@dsl.pipeline(name="hello_world_pipeline")
def hello_world_pipeline():
    """A simple hello world pipeline"""
    hello_task = hello_world("KFP User")

