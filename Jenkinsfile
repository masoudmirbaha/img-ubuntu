pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/masoudmirbaha/img-ubuntu.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    sh 'docker build -t myapp:latest .'
                }
            }
        }
        stage('Run Container') {
            steps {
                script {
                    echo 'Running Docker container...'
                    // اگر کانتینری با همین اسم هست حذف کن
                    sh 'docker stop myapp || true'
                    sh 'docker rm myapp || true'
                    // کانتینر روی پورت 8081 اجرا میشه چون 8080 Jenkinsه
                    sh 'docker run -d --name myapp -p 8081:8080 myapp:latest'
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
