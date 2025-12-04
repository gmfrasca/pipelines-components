# Hello World ✨

## Overview 🧾

A simple hello world component.

## Inputs 📥

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `name` | `str` | `World` | The name to greet. Defaults to "World". |

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
