"""Example Hello World Component

A simple example component that demonstrates basic Kubeflow Pipelines component structure.
"""

from kfp import dsl

@dsl.component(base_image="python:3.10")
def hello_world(name: str = "World") -> str:
    """A simple hello world component.  Added a new line to test the README generation.
    
    Args:
        name: The name to greet. Defaults to "World".
        
    Returns:
        A greeting message.
    """
    message = f"Hello, {name}!"
    print(message)
    return message

