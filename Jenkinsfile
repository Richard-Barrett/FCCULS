pipeline {
    agent any
    environment {
        tag = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()
    }

    stages {
        stage('Build core FCCULS image') {
            steps {
                // TODO: proper tagging
                sh "docker build -f Dockerfile -t $REPO/FCCULS:${tag} ."
                withCredentials([usernamePassword(credentialsId: 'common-dockerhub-up', usernameVariable: 'HUB_USER', passwordVariable: 'HUB_PASS')]) {
                    sh "docker login -u ${HUB_USER} -p ${HUB_PASS} && docker push $REPO/FCCULS:${tag}"
                }
            }
        }
    }
}