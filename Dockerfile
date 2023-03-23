FROM centos:7
LABEL author=rnstech version=v1
RUN yum install net-tools git wget -y
