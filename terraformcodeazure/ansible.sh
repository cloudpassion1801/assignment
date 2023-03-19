
echo 'private key is' 
echo "$(terraform output -raw private_key)">id_rsa
chmod 600 id_rsa

# ansible-playbook -i "thoughtworks@${1}," --private-key id_rsa --extra-vars "host_key_checking=False" ../ansiblecode/thoughtworks_role.yml

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i "thoughtworks@${1}," --private-key id_rsa  --extra-vars "host_key_checking=False" ../ansiblecode/thoughtworks_role.yml
