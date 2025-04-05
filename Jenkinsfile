pipeline {
    agent any

    environment {
        IMAGE_NAME = 'dumalaramesh/rameshdumala'
        DOCKER_CREDENTIALS_ID = 'dockerhub_credentials'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/RameshDumala1/ramesh.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✅ Docker image pushed successfully to DockerHub!"
        }
        failure {
            echo "❌ Build failed. Check the Jenkins logs for more details."
        }
    }
}
