pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/samanmasoumii/jenkins-test.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'chmod +x hello.sh'
                sh './hello.sh'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'echo "All tests passed!"'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying to production...'
                sh 'echo "Deployment complete!"'
            }
        }
    }
}
