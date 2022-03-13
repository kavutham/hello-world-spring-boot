# A Hello World Spring Boot App

A Hello World Spring Boot app.

# Pre-Requiste

1. Setup Actions runner in any machine. I have set-it up on my local windows. So all commands and parameters assignment are based on cmd commands
Follow the steps to setup the runner and start the process before running actions pipeline

2. Start the docker desktop or run docker daemon in the machine where your github runner is running

3. Install Java and Maven

4. Create a repository in Dockerub.

5. Add the secrets to your Github settings with Dockerhub username, password and repo name as given in the workflow yaml file.

# Stages Explained

Added CI Pipeline for Build, Test and create docker image and deploying to ECS

Build: Creates package and stores the artifact

Test: Dummy stage with junit plugin, but doesnt run as there is no test cases

Docker: Creates a docker image with base image thothbot/alpine-jre8, so docker might fail to run, so added the pripety file to run maven in jre 1.8. And pushed the image to the dockerub

Deploy To ECS: Dummy stage just prints output

Pipeline triggers on push of any commits to Master branch.


# Task 3:

To remove existing container and rerun with new image use the container-test.sh script. Can be exectued in linux machines. Pass the $container_name as argument along with  this script
./container-test.sh container-name

# Task 4: 

Added jib plugin directly to pom file. This plugin helps us to build docker image and push it to reponsitory without the need of dockerfile or daemon.
Pre-Requiste: Need to authenticate docker login or cred-helper from the machine this commnad is running. 
Run "mvn mvn compile jib:build"

