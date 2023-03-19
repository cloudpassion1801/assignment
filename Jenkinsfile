pipeline 
{
     agent any

     environment {
        ARM_SUBSCRIPTION_ID = credentials('SUBSCRIPTION_ID')
        ARM_TENANT_ID = credentials('TENANT_ID')
        ARM_CLIENT_ID = credentials('CLIENT_ID')
        ARM_CLIENT_SECRET = credentials('CLIENT_SECRET')
    }
    
    stages
    {
        stage('Install Basic Packages ')
         {
               steps {
                sh '''
                    apt update
                    apt-get -y install python3 python3-nacl python3-pip libffi-dev curl lsb-release software-properties-common wget unzip ssh sshpass vim gnupg software-properties-common
                    apt install ansible -y && ansible --version
                    wget https://releases.hashicorp.com/terraform/1.4.2/terraform_1.4.2_linux_amd64.zip && unzip terraform_1.4.2_linux_amd64.zip; pwd ;
                    mv terraform /usr/local/bin/
               '''
               }
                    
         }
       stage('Clone Existing Project')
        {
       
            // I have configured credentials in Jenkins with its id as anurag4516 & set password
            steps {
                checkout scm;
               
            }
            
        
        }
          
              
         stage("Deploy and Install in Azure ")
        {
          
             steps {
                  sh '''
                 rm -rf id_rsa
                 cd terraformcodeazure;
                 terraform init;
                 terraform plan -var env=prod;
                 terraform apply -auto-approve;
                 terraform output -raw private_key>id_rsa
                 cat id_rsa
                 chmod 600 id_rsa
                 ./ansible.sh "$(terraform output -raw public_ip_address)"
                 
                 '''
               
            }
           
        }  
         
 
        
        
        stage("Destroy")
        {
            steps {
                sh '''
                cd terraformcodeazure;
                 terraform destroy -auto-approve
                 echo 'Destroyed'
                 '''
               
            }
        }
        
    }
   
 post {
        always {
              sh '''
              cd terraformcodeazure;
                 terraform destroy -auto-approve;
                 echo 'Destroyed Successfully '
                 '''
            echo 'One way or another, I have finished'
            
            deleteDir() /* clean up our workspace */
        }
 }

}
