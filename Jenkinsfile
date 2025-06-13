//---------------------------------------------
// Author: Adam WezvaTechnologies
// Call/Whatsapp: +91-9739110917
//---------------------------------------------

pipeline {
agent { label 'packer' }

// Ensure environment variables are set as secret text type //
environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
}
stages{
  stage('Terraform'){
    steps {
            sh 'tar -cvf jenkinsrole.tar jenkins.yml roles'
            sh '/usr/local/bin/terraform init'
            sh '/usr/local/bin/terraform validate'
            sh '/usr/local/bin/terraform plan -out testplan'
            sh '/usr/local/bin/terraform apply -auto-approve'
        }
    }
  stage('trivy scan') {
            steps {
                script {
                    // Capture the latest AMI ID
                    def amiId = sh(
                        script: 'aws ec2 describe-images --owners self --query \'Images | sort_by(@, &CreationDate)[-1].ImageId\' --output text',
                        returnStdout: true
                    ).trim()
                    // Print the AMI ID to check
                    echo "Latest AMI ID: ${amiId}"
                    // Run the trivy scan using the captured AMI ID
                    sh "/usr/bin/trivy vm --scanners vuln ami:${amiId} --aws-region ap-south-1"
                }
            }
        }

         post {
        always {
            cleanWs()
        }
    }
    }
}

//---------------------------------------------
// Author: Adam WezvaTechnologies
// Call/Whatsapp: +91-9739110917
//---------------------------------------------
