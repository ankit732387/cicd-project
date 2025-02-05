pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('cicd-project')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/ankit732387/cicd-project.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t iccpinfotech/ankitnew:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push iccpinfotech/ankitnew:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
