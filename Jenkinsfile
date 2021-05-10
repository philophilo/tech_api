pipeline{
    agent any
    stages{

        stage("run test build") {
            steps {
                echo "Starting build..."
                sh 'docker-compose build'
                echo "Build complete..."
            }
        }

        stage("deploy") {
            steps {
                echo 'deploy starting...'
                sh 'docker-compose down'
                sh 'docker-compose up -d'
            }
        }
    }
}
