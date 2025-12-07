pipeline {
    agent any

    parameters {
        booleanParam(
            name: 'DEPLOY_NOW',
            defaultValue: true,
            description: 'Trigger deployment to EC2'
        )
    }

    environment {
        EC2_USER = 'ubuntu'
        EC2_HOST = '65.0.139.32'
        SSH_CRED = 'ec2-ssh-key'   // Jenkins credential ID
        APP_DIR = '/home/ubuntu/DevOps-Project-Two-Tier-Flask-App-using-AWS'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy to EC2') {
            when {
                expression { params.DEPLOY_NOW == true }
            }
            steps {
                // Use SSH private key from Jenkins credentials
                withCredentials([sshUserPrivateKey(credentialsId: SSH_CRED,
                                                  keyFileVariable: 'SSH_KEY')]) {
                    sh """
                    echo "Using SSH key at: \$SSH_KEY"
                    ssh -o StrictHostKeyChecking=no -i "\$SSH_KEY" ${EC2_USER}@${EC2_HOST} 'cd ${APP_DIR} && ./deploy.sh'
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Done! Deployment successful."
        }
        failure {
            echo "Deployment failed. Check logs."
        }
    }
}

