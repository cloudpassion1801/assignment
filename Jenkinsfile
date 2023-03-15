pipeline 
{
     agent {
        docker { image 'anurag4516/thoughtworksjenkisnbaseimage' }
    }
    stages
    {
       
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
                 terraform plan;
                 terraform apply -auto-approve;
                 terraform output -raw private_key > id_rsa
                 chmod 600 id_rsa
                 public_ip = ${terraform output -raw private_key > id_rsa}
                 echo ${public_ip}
                 ./test.sh ${public_ip}
                 
                 '''
               
            }
           
        }  
         
         
            

        stage("Validate ")
         {
             steps {
                sh 'echo "Hello World"'
               
            }
            
        }
        
        
        stage("Destroy")
        {
            steps {
                sh '''
                 terraform destroy -auto-approve
                 echo 'Destroyed'
                 '''
               
            }
        }
        
    }
   
 post {
        always {
              sh '''
                 terraform destroy -auto-approve;
                 echo 'Destroyed Successfully '
                 '''
            echo 'One way or another, I have finished'
            emailext body: 'A Test EMail', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: 'Test'
    
            deleteDir() /* clean up our workspace */
        }
 }

}
