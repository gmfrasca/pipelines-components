from kfp import dsl
#from kubeflow.pipelines.components.components.dev.demo import component as hello_world

@dsl.component
def hello_world():
    print("Hello")

@dsl.pipeline
def hello_world_pipeline(
    name: str = "World"
):
    """Example pipeline demonstrating the hello_world component.
    
    Args:
        name: Name to greet in the hello world message.
    """
    hello_task = hello_world()

