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
                sh 'make start'
                sh 'yes | docker system prune'
            }
        }
    }
}
