# Pipeline process

The pipeline was connected to GitHub by choosing the repository as a pipeline project and then choosing the name of the branch (that whenever commit changes the code) builds the project and does tests on it, and then publishes the project

It should be noted that *Environment Variables* have been added in the settings of the pipeline project, to automate the construction and not rely on the `.env` file that is not included in the repository.
