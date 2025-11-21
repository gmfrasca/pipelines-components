# Repository Governance

This document defines the governance structure for the Kubeflow Pipelines Components Repository.

## Table of Contents

- [Two-Tier System](#two-tier-system)
- [Ownership Models](#ownership-models)
- [Tier Transitions](#tier-transitions)
- [Removal Policies](#removal-policies)
- [Deprecation Policy](#deprecation-policy)
- [Repository Roles](#repository-roles)
- [Decision Making](#decision-making)
- [Conflict Resolution](#conflict-resolution)
- [Policy Updates](#policy-updates)
- [Related Documentation](#related-documentation)
- [Background](#background)

## Repository Roles

*Key roles and responsibilities for governing and maintaining the repository.*

### KFP Component Core Maintainers

Core Maintainers are responsible for the stewardship of Core-tier components. Their key responsibilities include:
- Defined by having an entry in the `approvers` section of the `OWNERS` file in either the repo root, `components/OWNERS`, and/or `pipelines/OWNERS` file(s)
- Ensuring the continuous conformance of Core components to repository standards (test coverage, documentation, security, backward compatibility).
- Overseeing the long-term stability and reliability of Core-tier components.
- Responding to issues, security vulnerabilities, and necessary upgrades in a timely manner.
- Approving major changes and coordinating releases that affect Core components.
- Working in alignment with the Kubeflow community and Kubeflow Steering Committee.


### KFP Component Third-Party Maintainers

Third-Party Maintainers are responsible for the Third-Party tier components that they or their teams own. Their key responsibilities include:
- Defined by having an entry in the `approvers` section of the `OWNERS` file in either the repo root, `third_party/OWNERS`, `third_party/components/OWNERS`, and/or `third_party/pipelines/OWNERS` file(s)
- Maintaining the conformance of Third-Party components to repository requirements (e.g., basic documentation, minimum test coverage, active ownership).
- Addressing issues and updates within their components.
- Managing the lifecycle (e.g., improvements, deprecation, or removal) of the components they maintain.
- Third-Party Maintainers are not responsible for Core-tier conformance or stability.


### Component Owners
Component Owners are individuals responsible for maintaining an individual core or third-party tier component
- Defined by having an entry in the `approves` section of the `OWNERS` file in the individual component or pipeline
- Acting as the main point of contact for their component(s).
- Reviewing and approving changes to their component(s).
- Ensuring ongoing quality and documentation for their component(s).
- Updating or transferring ownership when maintainers change.

All components must have at least two listed owners for redundancy and review coverage.

## Two-Tier System

*The repository uses a two-tier classification system distinguishing officially supported components from community contributions.*

## Core Tier


**Officially supported components** maintained by the KFP Component Core Maintainers.

**Requirements:**
- 90% test coverage (unit, integration, e2e) # TODO(gfrasca): confirm
- Security review passed
- Complete documentation
- Active maintenance commitment
- Backward compatibility guarantees

**Benefits:**
- Official support and maintenance
- Included in python package releases
- Priority for bug fixes
- Long-term stability guarantees

### Third-Party Tier

**Community-contributed components** with lighter requirements.

**Requirements:**
- 80% Unit test coverage  # TODO(gfrasca): confirm
- Basic documentation (README, examples)
- At least 2 maintainers

**Benefits:**
- Community visibility
- Shared maintenance burden
- Faster contribution process than Core components
- Good for idea incubation
- Potential for promotion to Core tier

## Ownership Models

*How ownership, maintenance, and decision-making responsibilities are distributed across tiers.*

### Core Tier
- **Owned by**: Kubeflow community
- **Maintained by**: Designated maintainer teams
- **Decisions by**: KFP Component Core Maintainers consensus
- **Support**: Official community support

### Third-Party Tier (no Kubeflow org membership required)
- **Owned by**: Original contributors
- **Maintained by**: Component owners
- **Decisions by**: Component owners
- **Support**: Best-effort community support

## Tier Transitions

*Process for moving components between Core and Third-Party tiers.*

### Promotion to Core

A component can be promoted from third-party tier to core following this process:

1. **Nomination**: Any contributer can nominate via GitHub issue #TODO(gfrasca): define this
2. **Review**: Technical and governance review
3. **Requirements**: Validate component meets all core tier requirements
4. **Decision**: Community and core-component Maintainer consensus approval
5. **Timeline**: 4-6 weeks review process

### Demotion from Core

A component can be demoted from core tier if one or more of the following conditions are met:

- Maintenance neglect (>6 months)
- Unadressed security issues
- Breaking changes without migration
- Community consensus

## Removal Policies

*Timeline and criteria for removing inactive or problematic components from the repository.*

### Verification Process (9 months)
Components are marked for verification if:
- No updates in over 9 months
- Maintainers are unresponsive
- Compatibility issues

### Removal Process (12 months)
After 12 months of inactivity:
1. **Notice**: 30-day removal notice
2. **Community input**: 2-week feedback period
3. **Final decision**: KFP Component Core Maintainers 
4. **Removal**: Delete component code from repository

### Emergency Removal
Immediate removal for:
- Severe and/or compatibility-breaking issues
- Critical security vulnerabilities
- Legal issues
- Malicious code

## Deprecation Policy

*Structured approach to deprecating core components with adequate notice and migration support.*

### Two-Release Policy
Components will be deprecated for a minimum of 2 Kubeflow releases before removal.

**Process:**
1. **Deprecation notice**: Mark as deprecated
2. **Migration guide**: Provide alternatives
3. **Community notice**: Announce in releases
4. **Removal**: After 2 releases


## Decision Making

*Framework for making technical, policy, and strategic decisions within the community.*

### Decision Types
- **Technical**: Component owners → KFP Component Core Maintainers 
- **Policy**: KFP Component Core Maintainers 
- **Strategic**: KFP Component Core Maintainers 

### Process
1. **Proposal**: Create GitHub issue/RFC
2. **Discussion**: Community feedback (1-2 weeks)
3. **Decision**: Appropriate authority level
4. **Implementation**: Assign and track

## Policy Updates

*How governance policies are updated to evolve with community needs and learnings.*

**Process:**
1. **RFC**: Propose changes via GitHub issue
2. **Community review**: 2-week feedback period
3. **Maintainers approval**: Majority vote required
4. **Implementation**: Update documentation and processes

**Criteria for updates:**
- Community needs evolution
- Process improvements
- Conflict resolution learnings
- External requirements changes

---

This governance model ensures quality, sustainability, and community collaboration while maintaining clear processes and expectations.

## Related Documentation

- **[Contributing Guide](CONTRIBUTING.md)** - How to contribute components
- **[Onboarding Guide](ONBOARDING.md)** - Getting started as a contributor  
- **[Testing Guide](TESTING.md)** - Code quality and testing standards
- **[Best Practices Guide](BESTPRACTICES.md)** - Component development best practices *(coming soon)*
- **[Agents Guide](AGENTS.md)** - AI agent components and patterns *(coming soon)*

## Background

This governance model is based on [KEP-913: Components Repository](https://github.com/kubeflow/community/tree/master/proposals/913-components-repo), which established the framework for a curated collection of reusable Kubeflow Pipelines components with clear quality standards and community governance.

For questions about governance, contact the pipelines-components repository maintainers (as noted by `approvers` in top-level `OWNERS` file) or open a GitHub issue.
