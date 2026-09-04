pipeline {
    agent any

    environment {
        DOCKER_USER = 'samanmasoumi'
        DOCKER_IMAGE = 'samanmasoumi/my-hello-app'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Getting code from GitHub...'
                git branch: 'main', 
                    url: 'https://github.com/samanmasoumii/jenkins-test.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t ${DOCKER_USER}/${DOCKER_IMAGE}:${DOCKER_TAG} ."
            }
        }
        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing image to Docker Hub...'
                withCredentials([usernamePassword(
                    credentialsId: 'docker-hub-credentials',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh '''
                        echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                        docker push ${DOCKER_USER}/${DOCKER_IMAGE}:${DOCKER_TAG}
                    '''
                }
            }
        }
        stage('Test Run Container') {
            steps {
                echo 'Testing container from Docker Hub...'
                sh "docker run --rm ${DOCKER_USER}/${DOCKER_IMAGE}:${DOCKER_TAG}"
            }
        }
    }
}
