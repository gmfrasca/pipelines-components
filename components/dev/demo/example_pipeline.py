from kfp import dsl
from kfp_components.hello_world import hello_world

@dsl.pipeline(name='hello-world-example')
def hello_world_pipeline(
    name: str = "World"
):
    """Example pipeline demonstrating the hello_world component.
    
    Args:
        name: Name to greet in the hello world message.
    """
    hello_task = hello_world(name=name)

