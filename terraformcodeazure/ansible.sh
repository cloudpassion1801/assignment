
echo 'private key is' 
echo "${terraform output -raw private_key}"
key=$(terraform output -raw private_key)
ansible-playbook -i "thoughtworks@${1}," --private-key id_rsa --extra-vars "host_key_checking=False" ../ansiblecode/thoughtworks_role.yml

ansible-playbook -i "thoughtworks@${1}," --private-key "${key}" --extra-vars "host_key_checking=False" ../ansiblecode/thoughtworks_role.yml
