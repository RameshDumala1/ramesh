pipeline {
    agent any

    environment {
        IMAGE_NAME = 'dumalaramesh/rameshdumala'
        DOCKER_CREDENTIALS_ID = 'dockerhub_credentials'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/RameshDumala1/ramesh.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("${IMAGE_NAME}:latest")
                    // Save the image reference for use in the next stage
                    env.BUILT_IMAGE = dockerImage.id
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    def dockerImage = docker.image("${IMAGE_NAME}:latest")
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
