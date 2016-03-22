FROM centos/python-27-centos7
USER root

COPY src /src
WORKDIR /src
RUN yum install -y python-ordereddict python-six python-jenkins python-pbr \
    && rpm -i python-pyyaml-3.11-1.x86_64.rpm \
    && rpm -i python-jenkins-job-builder-1.4.0-1.noarch.rpm
USER user
