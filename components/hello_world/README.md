# Hello World ✨

## Overview 🧾

A simple hello world component.

## Inputs 📥

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `name` | `str` | `World` |  |

## Outputs 📤

| Name | Type | Description |
|------|------|-------------|
| Output | `str` | A greeting message. |

## Usage Example 🧪

```python
from kfp import dsl
from kfp_components.hello_world import hello_world

@dsl.pipeline(name='example-pipeline')
def my_pipeline():
    hello_world_task = hello_world(
        name="name_value",
    )
```

## Metadata 🗂️

```yaml
tier: core
name: hello_world
stability: stable
dependencies:
  kubeflow:
  - name: Pipelines
    version: '>=2.5'
  - name: Trainer
    version: '>=2.0'
  external_services:
  - name: Argo Workflows
    version: '3.6'
tags:
- hello-world
lastVerified: 2025-11-13 00:00:00+00:00
links:
  documentation: https://kubeflow.org/components/hello-world/
  issue_tracker: https://github.com/kubeflow/pipelines-components/issues
```

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