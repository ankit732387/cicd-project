pipeline {
    agent any 

    environment {
        DOCKERHUB_CREDENTIALS = credentials('ankit-kumar')
        IMAGE_NAME = 'ankit732387/ankitnew'
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages { 
        stage('SCM Checkout') {
            steps {
                git 'https://github.com/ankit732387/cicd-project.git'
            }
        }

        stage('Build docker image') {
            steps {
                // Remove sudo and build with dynamic tag
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}
