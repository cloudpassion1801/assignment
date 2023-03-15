#!/bin/bash
sudo yum update -y --disablerepo='*' --enablerepo='*microsoft*' && sudo  yum -y install rh-python36 && sudo yum -y install python3-dnf