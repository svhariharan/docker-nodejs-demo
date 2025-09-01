pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker_creds')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/rama25krishna/docker-nodejs-demo.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t rama25krishna/nodeapp_1:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push rama25krishna/nodeapp_1:$BUILD_NUMBER'
            }
        }
        
        stage('Run Container') {
            steps {
                    sh "docker run -d --name node_app_$BUILD_NUMBER rama25krishna/nodeapp_1:$BUILD_NUMBER"
            }
        }   

                stage('Run Second Job') {
            steps {
                    build job: 'sib_job_2', wait: true
            }
        }  
}
post {
        always {
            sh 'docker logout'
        }
    }
}

