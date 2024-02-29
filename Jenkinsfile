pipeline {
    agent any
    
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-credentials')
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
                    withDockerRegistry(credentialsId: 'docker-credentials', url: 'https://index.docker.io/v1/') {
                        docker.image("${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
}
