# App Dependencies
In this project, you will take a newly developed full stack application and deploy it to a cloud service provider so that it is available to customers. This application contains the main components of a 3-tier full stack application (**UI**,  **API**, and  **Database**).

You will have to do the following:
-   **Configure the services and infrastructure on AWS:**
    - RDS: for managing databases such as PostgreSQL.
    - S3 Bucket: to store static files for serving the user interface.
    - Elastic Beanstalk Stack: This is for API service, and you must learn     how to deal with EB CLI to make a deployment for the code.
-   **Scripts to deploy each component of the application**
*code exapmle:*
```
version: 2.1
orbs:
  # orgs contain basc recipes and reproducible actions (install node, aws, etc.)
  node: circleci/node@5.0.2
  eb: circleci/aws-elastic-beanstalk@2.0.1
  aws-cli: circleci/aws-cli@3.1.1
  # different jobs are calles later in the workflows sections

jobs:
  build:
    docker:
      # the base image can run most needed actions with orbs
      - image: "cimg/node:14.15"
    steps:
      # install node and checkout code
      - node/install:
          node-version: '14.15'         
      - checkout
      # Use root level package.json to install dependencies in the frontend app
      - run: #Install Front-End Dependencies
          name: Install Front-End Dependencies
          command: |
            echo "NODE --version" 
            echo $(node --version)
            echo "NPM --version" 
            echo $(npm --version)
            npm run frontend:install
      # TODO: Install dependencies in the the backend API          
      - run:
          name: Install API Dependencies
          command: |
           echo "Install dependencies in the the backend API"
           npm run api:install
      # TODO: Lint the frontend
      - run:
          name: Front-End Lint
          command: |
            echo "Lint the frontend"
            npm run frontend:lint
      # TODO: Build the frontend app
      - run:
          name: Front-End Build
          command: |
            echo "Build the frontend app"
            npm run frontend:build
      # TODO: Build the backend API      
      - run:
          name: API Build
          command: |
            echo "Build the backend API"
            npm run api:build
  # deploy step will run only after manual approval
  deploy:
    docker:
      - image: "cimg/base:stable"
      # more setup needed for aws, node, elastic beanstalk
    steps:
      - node/install:
          node-version: '14.15' 
      - eb/setup
      - aws-cli/setup
      - checkout
      # TODO: Install, build, deploy in both apps
      - run:
          name: Deploy API
          command: |
            echo "Install, build, deploy in both apps"
            npm run api:deploy
      - run:
          name: Deploy Frontend
          command: |
            echo "Install, build, deploy in both apps"
            npm run frontend:deploy

workflows:
  udagram:
    jobs:
      - build:
          filters:
              branches:
                only:
                  - main
          # type: approval
          # requires:
          #   - build
      - deploy:
          requires:
            - build
    ```