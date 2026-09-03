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
                sh 'docker build -t samanmasoumi/my-hello-app:latest .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing image to Docker Hub...'
                withCredentials([string(credentialsId: 'docker-hub-token', variable: 'DOCKER_TOKEN')]) {
                    sh '''
                        echo $DOCKER_TOKEN | docker login -u samanmasoumi --password-stdin
                        docker push samanmasoumi/my-hello-app:latest
                    '''
                }
            }
        }
        stage('Run Container') {
            steps {
                echo 'Running container from Docker Hub...'
                sh 'docker run --rm samanmasoumi/my-hello-app:latest'
            }
        }
    }
}
