pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'nginx'
        DOCKER_CREDENTIALS_ID = 'dockerhub_credentials'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git ''https://github.com/betawins/multi-stage-example.git”
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:latest")
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
            echo "Docker image pushed successfully."
        }
        failure {
            echo "Something went wrong. Check logs."
        }
    }
}
