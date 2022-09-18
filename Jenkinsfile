pipeline {
  agent any
  stages {
    stage('Git Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build . -t 776487083560.dkr.ecr.us-east-1.amazonaws.com/project-code-786:${BUILD_NUMBER}'
        sh 'docker push 776487083560.dkr.ecr.us-east-1.amazonaws.com/project-code-786:${BUILD_NUMBER}'
          }
        }
}
}

