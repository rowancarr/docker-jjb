# docker-jjb

[![Build Status](https://travis-ci.org/rowancarr/docker-jjb.svg?branch=master)](https://travis-ci.org/rowancarr/docker-jjb)

This image has been created for a number of reasons, the first is to generate RPM's for a Centos installation, and the second (which is more of a product of the first) to run jenkins-job-builder from inside a Docker container.

## Dependencies
We rely on my docker-fpm image to have some of the tools installed to generate the rpms required for installing jenkins-job-builder

## Usage

Create the rpm artifacts and test rpm's work
```
make build test
```

If you want to use the rpm artifacts outside the container then you need to make sure you satisfy the jenkins-job-builder dependencies `python-ordereddict python-six python-jenkins python-pbr`
