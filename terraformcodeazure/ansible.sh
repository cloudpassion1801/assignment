ansible-playbook -i "thoughtworks@${1}," --private-key "$(terraform output -raw private_key)" --extra-vars "host_key_checking=False" ../ansiblecode/thoughtworks_role.yml
