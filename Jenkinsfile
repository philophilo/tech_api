pipeline{
    agent any
    stages{

        stage("run test build") {
            steps {
                sh '''
                    echo "Starting build..."
                    make build.
                    echo "Build complete..."
                '''
            }
        }

        stage("deploy") {
            steps {
                sh '''
                    make start
                    yes | docker system prune
                '''
            }
        }
    }
}
