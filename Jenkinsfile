pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/masoudmirbaha/img-ubuntu.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    sh 'docker build -t myapp:latest .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    echo "Running Docker container..."
                    sh '''
                        docker stop myapp || true
                        docker rm myapp || true
                        docker run -d --name myapp -p 8080:8080 myapp:latest
                    '''
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline finished."
        }
    }
}
