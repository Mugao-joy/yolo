# Ansible Playbook Explanation

This document explains the reasoning for the order of execution in the `playbook.yml` file, which automates the setup of frontend and backend Docker containers.

---

### 1. **Update and Upgrade Packages**

- name: Update and upgrade apt packages
  apt:
    update_cache: yes
    upgrade: dist
    name: nodejs
    state: present
Reasoning: The playbook begins by ensuring that nodejs is updated, ensuring the latest compatible version is installed. The system is upgraded to prevent any outdated packages from interfering with the process.

---
### 2. **Install Node.js and npm**


- name: Install Node.js
  apt:
    name: nodejs
    state: present
- name: Install npm
  apt:
    name: npm
    state: present
Reasoning: These tasks install Node.js and npm, essential dependencies for both the frontend and backend applications.

### 3. **Install Docker and Docker Compose**

- name: Install Docker
  apt:
    name: docker.io
    state: present
- name: Install Docker Compose
  apt:
    name: dockerComposejoy
    state: present
Reasoning: Docker and Docker Compose are installed to handle containerization of both frontend and backend services. Docker Compose simplifies the orchestration of multi-container applications.

### 4. **Clone the Project Repository**

- name: Clone project repository
  git:
    repo: "{{ https://github.com/Mugao-joy/yolo }}"
    dest: /home/vagrant/project
Reasoning: The project repository is cloned into the /home/vagrant/project directory. This ensures the latest version of the code is available for deployment.

### 5. **Set Permissions for Docker**

- name: Set permissions for Docker
  shell: |
    usermod -aG docker $USER
    newgrp docker
Reasoning: This task adds the current user to the Docker group to allow running Docker commands without requiring sudo.

### 6. **Build and Run Docker Containers**

- name: Build and run Docker containers
  shell: |
    dockerComposejoy up -d
Reasoning: This command builds the Docker containers and starts them in detached mode. It ensures both the frontend and backend are running in containers.

### 7. **Include Frontend Role**

- name: Include frontend role
  include_role:
    name: ClientRoles
Reasoning: The ClientRoles role is included to configure and deploy the frontend. This might include tasks like building the client app, setting environment variables, and preparing it for production.

### 8. **Include Backend Role**

- name: Include backend role
  include_role:
    name: BackendRoles
Reasoning: the BackendRoles role is included to configure and deploy the backend, ensuring both the frontend and backend services are properly set up.