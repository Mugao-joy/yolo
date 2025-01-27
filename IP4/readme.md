# Stage Two: Terraform and Ansible Integration

## Overview

This repository contains an integrated solution for provisioning and configuring infrastructure using **Terraform** and **Ansible**. The infrastructure is set up with **Terraform** and the application is deployed using **Ansible**, which automates the setup of frontend and backend Docker containers.

## Directory Structure


stage_two/
│
├── Terraform/
│   ├── main.tf
│   └── 
│
├── Ansible/
│   ├── site.yml
│   └── 

**Terraform Configuration**
The Terraform files are responsible for provisioning infrastructure such as Virtual Machines, networking, and storage. The configuration is defined in **main.tf** .This configuration sets up a VirtualBox VM with specified resources

**Ansible Configuration**
The Ansible playbook handles the installation and configuration of Docker, along with the deployment of the frontend and backend containers. It’s organized into several tasks that ensure the correct order of execution.