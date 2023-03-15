FROM ubuntu:bionic
RUN apt update
RUN apt-get -y install python3 python3-nacl python3-pip libffi-dev curl lsb-release software-properties-common wget unzip ssh sshpass vim
RUN apt install ansible -y && ansible --version
RUN wget https://releases.hashicorp.com/terraform/0.14.0/terraform_0.14.0_linux_amd64.zip && unzip terraform_0.14.0_linux_amd64.zip && mv terraform ~/bin
WORKDIR /app
# COPY . .


