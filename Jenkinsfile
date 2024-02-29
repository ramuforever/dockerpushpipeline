pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-credentials-id')
        DOCKER_IMAGE_NAME = 'prudwe/docker-pipeline-test'
        DOCKERFILE_PATH = 'Dockerfile'
    }
    
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/prudwe/sparkjava-war-example.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}", "-f ${DOCKERFILE_PATH} .")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://login.docker.com/', "${DOCKER_HUB_CREDENTIALS}") {
                        docker.image("${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
}
