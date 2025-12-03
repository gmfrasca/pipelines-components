# Hello World Pipeline ✨

## Overview 🧾

A simple hello world pipeline.

This pipeline demonstrates how to create a basic Kubeflow Pipeline
that uses the hello_world component.

## Inputs 📥

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `name` | `str` | `Kubeflow` | The name to greet. Defaults to "Kubeflow". |
| `greeting_prefix` | `str` | `Hello` | The greeting prefix. Defaults to "Hello". |

## Outputs 📤

| Name | Type | Description |
|------|------|-------------|
| Output | `str` | The greeting message from the hello_world component. |


## Metadata 🗂️

- **Name**: hello_world_pipeline
- **Description**: A simple hello world pipeline that demonstrates basic Kubeflow Pipelines pipeline structure
- **Components**: 
  - hello_world
- **Image**: registry.access.redhat.com/ubi8/ubi-minimal:latest
- **Tier**: core
- **Stability**: stable
- **Dependencies**: 
  - Kubeflow:
    - Name: Pipelines, Version: >=2.5
    - Name: Trainer, Version: >=2.0
  - External Services:
    - Name: Argo Workflows, Version: 3.6
- **Tags**: 
  - hello-world
  - example
  - demo
- **Last Verified**: 2025-11-14 00:00:00+00:00
- **Owners**: 
  - Approvers:
    - gmfrasca
  - Reviewers:
    - gmfrasca

## Additional Resources 📚

- **Documentation**: [https://kubeflow.org/pipelines/hello-world/](https://kubeflow.org/pipelines/hello-world/)
- **Issue Tracker**: [https://github.com/kubeflow/pipelines-components/issues](https://github.com/kubeflow/pipelines-components/issues)
