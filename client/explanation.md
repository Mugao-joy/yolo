Explanation of Implementation
This document outlines the rationale and approach taken to containerize the e-commerce project, detailing choices, implementations, and best practices.

1. Choice of the Base Image

2. Dockerfile directives used in the creation and running of each container.
3. Docker-compose Networking (Application port allocation and a bridge network implementation) where necessary.
4. Docker-compose volume definition and usage (where necessary).
5. Git workflow used to achieve the task.
=========================================================================================================
6. Successful running of the applications and if not, debugging measures applied.

    -----I was getting a node version error that was preventing the client side from running locally and instead of downgrading the node bersion i used the following command----------
        export NODE_OPTIONS=--openssl-legacy-provider
        npm start

    --------for the database i Used the official MongoDB Docker image: No additional setup is needed since MongoDB’s image is prebuilt.----------
==========================================================================================================
7. Good practices such as Docker image tag naming standards for ease of identification of images and containers. 
8. There is a screenshot of your deployed image on DockerHub, clearly showing the version of the image

export NODE_OPTIONS=--openssl-legacy-provider
npm start
