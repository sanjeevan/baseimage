# Docker baseimage for apps

Base image for docker containers. Uses Alpine for the OS + runit for services. See the example service to learn how to create
services that will run when the container is started.

### To build image

  `docker build . -t pureparadox/base`
  
### To pull image

  `docker pull pureparadox/base`
  
