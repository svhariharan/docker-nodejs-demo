pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker_creds')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://https://github.com/svhariharan/docker-nodejs-demo.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t svhariharan/nodeapp:$BUILD_NUMBER .'
            }
        }
        
        stage('Run Container') {
            steps {
                    sh "docker run -d --name node_app_$BUILD_NUMBER svhariharan/nodeapp:$BUILD_NUMBER"
            }
        }   
}
post {
        always {
            sh 'docker logout'
        }
    }
}
