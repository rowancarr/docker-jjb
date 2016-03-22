# docker-jjb
This image has been created for a number of reasons, the first is to generate rpms for a centos installation, and the second (which is more of a product of the first) to run jenkins-job-builder from inside a docker conatiner.

## Dependancies
We rely on my docker-fpm image to have some of the tools installed to generate the rpms required for installing jenkins-job-builder

## Usage

Create the rpm artifacts and test rpm's work
```
make build test
```

If you want to use the rpm artifacts outside the conatiner then you need to make sure you satisfy the jenkins-job-builder dependancies `python-ordereddict python-six python-jenkins python-pbr`
