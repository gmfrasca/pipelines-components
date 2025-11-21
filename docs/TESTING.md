# Testing and Code Quality

This guide covers testing and code quality standards for the Kubeflow Pipelines Components Repository.

## Table of Contents

- [Testing](#testing)
- [Configuration](#configuration)
- [Before Submitting](#before-submitting)
- [CI Pipeline](#ci-pipeline)
- [Getting Help](#getting-help)

## Testing

*Comprehensive testing requirements including unit, integration, and component tests.*

### Unit Tests

```bash
# Run all tests
pytest

# Run with coverage (minimum 80% required)
pytest --cov=src --cov-report=html

# Run specific tests
pytest tests/test_my_component.py -v
```

### Integration Tests
*These integration tests validate that your components run as expected within a real (Kind) Kubernetes cluster, ensuring correct behavior when deployed in their intended environment.*


```bash
# Set up test cluster
kind create cluster --name kfp-test

# Run integration tests
pytest tests/integration/

# Clean up
kind delete cluster --name kfp-test
```

### Component Tests

*Component tests verify the functionality of a component, including basic usage, expected outputs, etc.*


```bash
# Build and test component
docker build -t my-component:test components/my-component/
pytest tests/components/test_my_component.py
```

### Pre-commit Hooks

*Pre-commit checks to ensure code linting and format standards are met for any files added or updated*

```bash
# Install hooks
pre-commit install

# Run on all files
pre-commit run --all-files
```

## Before Submitting

*Final checklist to ensure your code meets all quality and testing standards.*

Run this checklist before creating a pull request:

```bash
# 1. Format and lint
black --check --line-length 120
pydocstyle --convention=google
python scripts/validate_metadata.py

# 2. Test
pytest

# 3. Run pre-commit
pre-commit run --all-files

# 4. Build components (only needed if using custom images)
docker build -t test-component components/my-component/
```

## CI Pipeline

*Automated checks that run on every pull request to ensure code quality.*

Our GitHub Actions automatically run:
- Code quality checks (Black, Flake8, pydocstyle, MyPy)
- Unit and integration tests
- Container builds
- Security scans

## Getting Help

*Resources and support channels for testing and code quality questions.*

- Open a [GitHub Issue](https://github.com/kubeflow/pipelines-components/issues) for testing infrastructure problems
- Ask in [#kubeflow-pipelines Slack](https://kubeflow.slack.com/channels/kubeflow-pipelines)
- See [Contributing Guide](CONTRIBUTING.md) for more details

