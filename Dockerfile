FROM ubuntu:bionic
RUN apt update
RUN apt-get -y install python3 python3-nacl python3-pip libffi-dev curl lsb-release software-properties-common wget unzip ssh sshpass vim
RUN apt install ansible -y && ansible --version
RUN wget https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_linux_amd64.zip && unzip terraform_1.4.2_linux_amd64.zip && mv terraform /app
WORKDIR /app
# COPY . .

