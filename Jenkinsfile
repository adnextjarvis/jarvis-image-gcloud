pipeline {
    agent none
    environment {
        DOCKERHUB_JARVIS_CREDENTIALS = credentials('DOCKERHUB_JARVIS_CREDENTIALS')
        repository = 'adnextjarvis/jarvis-image-gcloud'
    }
    stages {
        stage('Build & Tag image') {
            agent { label 'docker' }
            steps {
                script {
                  COMMIT_ID = sh(returnStdout: true, script: 'git rev-parse HEAD')
                  IMAGE_TAG = "v1.0.0"
                  sh 'echo $GOOGLE_CREDENTIALS > keyfile.json'
                  sh 'docker login -u _json_key -p "$(cat keyfile.json)"'
                  sh "docker build . -t ${repository}:${IMAGE_TAG}"

                  // dgoss testing step. See goss.yaml for specification.
                  //sh "export GOSS_FILES_STRATEGY=cp && dgoss run -it ${repository}:${IMAGE_TAG}"
                  sh "docker push ${repository}:${IMAGE_TAG}"
                }
            }
        }
    }
    post {
        failure {
            script {
                mail (to: 'adoptnext@gmail.com',
                        subject: "jarvis-image-gcloud build failed.",
                        body: "Please check Dockerfile & Jenkinsfile for any failures"
                );
            }
        }
    }
}