pipeline {
    agent any

    parameters {
        choice(
            name: 'DEPLOY_ENV',
            choices: ['development', 'staging', 'production'],
            description: 'Select the environment to deploy to'
        )
    }

    environment {
        DOCKER_USER = 'samanmasoumi'
        DOCKER_IMAGE = 'my-hello-app'
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
                withCredentials([string(credentialsId: 'docker-hub-credentials', variable: 'DOCKER_TOKEN')]) {
                    sh '''
                        echo $DOCKER_TOKEN | docker login -u samanmasoumi --password-stdin
                        docker push ${DOCKER_USER}/${DOCKER_IMAGE}:${DOCKER_TAG}
                    '''
                }
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploying to environment: ${params.DEPLOY_ENV}"
                sh '''
                    if [ "${params.DEPLOY_ENV}" = "production" ]; then
                        echo "🚀 Deploying to PRODUCTION server!"
                    elif [ "${params.DEPLOY_ENV}" = "staging" ]; then
                        echo "🧪 Deploying to STAGING server!"
                    else
                        echo "💻 Deploying to DEVELOPMENT server!"
                    fi
                '''
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
