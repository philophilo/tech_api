pipeline{
    agent any
    stages{

        stage("run test build") {
            when {
                branch "feature/*"
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
                    branch "develop";
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
