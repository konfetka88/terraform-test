
# Pulls centos 7 image

FROM centos:7

RUN yum install wget unzip -y && \
    #yum update -y             && \
    wget https://releases.hashicorp.com/terraform/0.12.17/terraform_0.12.17_linux_amd64.zip && \
    unzip terraform_0.12.17_linux_amd64.zip -d /usr/local/bin/ && \
    terraform -v && \
    yum install elinks -y && \
    yum install telnet -y

CMD ["/usr/bin/sleep" "infinity"]