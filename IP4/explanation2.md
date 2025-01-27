# Explanation of Ansible Playbook Execution Order

The playbook begins with a series of tasks focused on preparing the environment before deploying the frontend and backend containers. The order is chosen to ensure that dependencies and resources are in place before execution.

### 1. **Update and Upgrade apt Packages**
   - Ensures that all packages on the system are up-to-date, including Node.js and npm, ensuring compatibility for later tasks.

### 2. **Install Node.js and npm**
   - Required for both frontend and backend tasks. This ensures that Node.js and npm are installed before pulling the app repository and building it.

### 3. **Install Docker**
   - Docker is essential for containerizing the app. This task ensures that Docker is installed before any containers can be run.

### 4. **Install Docker Compose**
   - Docker Compose is needed to manage multi-container setups, which will be used to deploy both frontend and backend containers.

### 5. **Clone the Project Repository**
   - Clones the GitHub project repo to the server, providing the necessary source code for both frontend and backend.

### 6. **Set Permissions for Docker**
   - Updates user permissions to allow Docker access without requiring `sudo`.

### 7. **Build and Run Docker Containers**
   - Builds and launches the containers using Docker Compose. This step ensures both containers are started after everything else is set up.

### 8. **Include Frontend Role**
   - Calls the `ClientRoles` role to handle all frontend-specific tasks, such as pulling the frontend image and configuring the container.

### 9. **Include Backend Role**
   - Calls the `BackendRoles` role to handle backend-related tasks like pulling the backend image and configuring its container.

### Ansible Modules Used:

- **apt**: Used to install necessary packages (Node.js, npm, Docker, Docker Compose).
- **git**: Clones the project repository from GitHub.
- **shell**: Executes shell commands, such as setting Docker permissions and building Docker containers.
- **include_role**: Includes frontend and backend roles to modularize the playbook and simplify the execution process.

By structuring the playbook this way, we ensure that all dependencies are installed and the necessary resources are created before starting the containerization process, leading to a smooth deployment of the application.
