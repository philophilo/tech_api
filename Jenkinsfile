pipeline{
    agent any
    stages{

        stage("run test build") {
            when {
                branch "master";
                branch "develop";
            }
            steps {
                sh '''
                    echo "Starting build..."
                    make build.
                    echo "Build complete..."
                '''
            }
        }

        stage("deploy") {
            when {
                anyOf {
                    branch "master";
                }
            }
            steps {
                sh '''
                    make start
                    yes | docker system prune
                '''
            }
        }
    }
}
