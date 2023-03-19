ansible-playbook -i "thoughtworks@${1}," --private-key id_rsa --extra-vars "host_key_checking=False" ../ansiblecode/thoughtworks_role.yml
