# Hello World ✨

## Overview 🧾

A simple hello world component.

## Inputs 📥

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `name` | `str` | `World` | The name to greet. Defaults to "World".  Also editting this to trigger a workflow failure |

## Outputs 📤

| Name | Type | Description |
|------|------|-------------|
| Output | `str` | A greeting message. |

## Usage Example 🧪

```python
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


```

## Metadata 🗂️

- **Tier**: core
- **Name**: hello_world
- **Stability**: stable
- **Dependencies**: 
  - Kubeflow:
    - Name: Pipelines, Version: >=2.5
    - Name: Trainer, Version: >=2.0
  - External Services:
    - Name: Argo Workflows, Version: 3.6
- **Tags**: 
  - hello-world
- **Last Verified**: 2025-11-13 00:00:00+00:00
- **Owners**: 
  - Approvers:
    - gmfrasca
  - Reviewers:
    - gmfrasca

## Additional Resources 📚

- **Documentation**: [https://kubeflow.org/components/hello-world/](https://kubeflow.org/components/hello-world/)
- **Issue Tracker**: [https://github.com/kubeflow/pipelines-components/issues](https://github.com/kubeflow/pipelines-components/issues)


<!-- custom-content -->

## Custom Notes

This is custom content that should be preserved when regenerating the README.

### Additional Examples

Here are some additional usage examples:

```python
# Using hello_world in a more complex pipeline
@dsl.pipeline(name='multi-greeting-pipeline')
def multi_greeting_pipeline():
    hello_world_task1 = hello_world(name="Alice")
    hello_world_task2 = hello_world(name="Bob")
    hello_world_task3 = hello_world(name="Charlie")
```

### Known Issues

- None at this time

### Changelog

- **v1.0.0** - Initial release