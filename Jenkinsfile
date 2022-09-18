pipeline {
  stages {
    stage('Git Checkout') {
      steps {
        checkout node-app
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'cd app && sudo docker build . -t 776487083560.dkr.ecr.us-east-1.amazonaws.com/project-code-786:${BUILD_NUMBER}'
        sh 'sudo docker push 776487083560.dkr.ecr.us-east-1.amazonaws.com/project-code-786:${BUILD_NUMBER}'
          }
        }
}
}

