[![CircleCI](https://dl.circleci.com/status-badge/img/gh/RusselMusas/project-ml-microservice-kubernetes/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/RusselMusas/project-ml-microservice-kubernetes/tree/master)

## Introduction

Given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, 
teacher-to-pupil ratios, and so on. Data initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). The task is to operationalize the Microservice API using Docker and Kubernetes.

> The motivation behind this project is to put into test and validate skill in deploying successfully Machine Learning Microservice API using the containers way, docker and kubernetes stacks.

### Project Summary

> This Project expose a Machine Learning Microservice API and allows to make Predictions.

### Tech stack

The tech stack in this project include tools and technologies below:
1. Docker containers
2. Kubernetes clusters
3. Linux OS
4. Python3
5. Hadolint
6. Makefile
7. Scripting
8. Cicleci
9. Git & Github
10. Flask

### How to Run Scripts in This Application

#### Run application in standalone (install dependencies, lint, run)

* Make sure you have python3.7 installed (or install it with command: sudo apt update && sudo apt-get install python3.7)
* Create python venv and activate it (python3 -m venv ~/.devops && source ~/.devops/bin/activate)
* Run `make install` to install dependencies locally
* Run `make lint` to lint application and Dockerfile
* Standalone Run: python app.py (if you get error for Port 80, please update port value in app.py with what is available in your system)

### Setup docker (use docker desktop or cloud9: I used docker desktop)
* Setup and Configure Docker locally (check with command: $ docker version)
* Build docker container and Run it locally: ($ docker build --tag=sklearn-api .) 
* List containers images: ($ docker image ls)
* Run docker container locally: ($ docker run -ip 8000:80 sklearn-api) 
* Build, List and Run steps are recorded in the script `./run_docker.sh` as required
* Upload docker container to docker hub: commands are recorded in the script `./upload_docker.sh`

#### Setup kubernetes locally and Run container via Kubernetes

* Setup and Configure Kubernetes locally (Install docker desktop and enable kubernetes, then kubectl command line will be installed, For local kubernetes cluster, we used minikube: $ minikube start)
* Run container in Kubernetes: Use command: kubectl create deploy sklearn-api --image=russelmusas/sklearn-api:v1.0.0 as mentionned in script `./run_kubernetes.sh` (First time the forward port will fail, wait some minutes for the pod to complete starting process and change status to Running, then Run the script one more time)
* Make prediction: `./make_prediction.sh` (Run this script in seperate terminal to make Predictions)
* Configure .circleci/config.yml file
* Push project into Github repository
* Add project in Circleci and start building (if linting is successfull, "passed" badge is added on Readme section of Github repository)

### Files in this Repository

1. run_docker.sh : Script for build docker image, list images and run docker image created
2. make_prediction.sh: Perform api request and make a Prediction, displays response
3. upload_docker.sh: Login to docker hub and Upload docker image created
4. run_kubernetes.sh: Run docker container with kubernetes, List pods and Forward container port to a host target port
5. Dockerfile: Contains directives for creating Docker container
6. Makefile: Contains directives for installing packages, linting, setup python venv, ...
7. `output_txt_files/docker_out.txt`: contains request output from `./make_prediction.sh` request after running docker container locally
8. `output_txt_files/kubernetes_out.txt`: contains request output from `./make_prediction.sh` request after running docker container with kubernetes
9. README.md: contains Project summary
10. `app.py`: contains actual flask application to run
11. `.circleci/config.yml`: contains circleci configurations for running project in circleci pipeline
