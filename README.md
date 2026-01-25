# hasher-CICD

# [![Continuous Integration (CI)](https://github.com/mahmoudnasser1561/hasher-CICD/actions/workflows/ci.yaml/badge.svg)](https://github.com/mahmoudnasser1561/hasher-CICD/actions/workflows/ci.yaml)

A small backend **hashing service** + a production-style **CI/CD pipeline** built with **GitHub Actions** and deployed to **AWS Elastic Beanstalk**.

> ⚠️ **Work in progress:** This project is actively evolving. The CI/CD flow works end-to-end today, but the infrastructure and deployment strategy will be improved (Terraform + Ansible + Blue/Green).

---

## What this repo demonstrates

-  **Quality gates before deploy**: linting, unit tests, security audit, static analysis
-  **Automated deployment** to **AWS Elastic Beanstalk**
-  **Post-deploy verification**: smoke tests against the live Elastic Beanstalk environment endpoint

--

## Service overview

This repository contains a lightweight backend service that exposes an HTTP API to generate hashes.

Typical capabilities:
- Hash an input payload
- Provide a health endpoint for readiness checks

### Stages

1) **Checkout**
- Pull source code into the runner

2) **Build**
- Build/package the application artifact (or container image, depending on current setup)

3) **Quality & security gates**
- **Lint** (style + formatting)
- **Tests** (unit/integration)
- **Security audit** (dependency scanning)
- **Static analysis** (basic SAST / code scanning)

4) **Deploy**
- Deploy to **AWS Elastic Beanstalk** (Recreat deployment strategy)

5) **Verify production**
- Run a **smoke test** that calls the live environment endpoint (ELB URL)
- Fails the workflow if the deployed service is not healthy / not responding as expected


# Todo

- Current Recreat strategy
<img width="924" height="162" alt="image" src="https://github.com/user-attachments/assets/08aa99ec-5bd7-499c-8e91-403797da3978" />

<br> <br>
- Plan to migrate to Blue/Green strategy
  <br>

  <img width="481" height="347" alt="Blue-Green" src="https://github.com/user-attachments/assets/58325bb0-83ff-43c5-8100-0aa82c5d3c26" />
