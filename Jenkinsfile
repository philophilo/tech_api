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
            when {
                branch "master";
            }
            steps {
                echo 'deploy starting...'
                sh 'docker network create tech_api_net'
                sh 'docker-compose up -d'
                sh 'yes | docker system prune'
            }
        }
    }
}
