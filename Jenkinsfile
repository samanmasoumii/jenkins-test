pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/samanmasoumii/jenkins-test.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t my-hello-app .'
            }
        }
        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                sh 'docker run --rm my-hello-app'
            }
        }
    }
}
