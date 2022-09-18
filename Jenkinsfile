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

    stage("Deploy node app") {
      steps{
        withCredentials([sshUserPrivateKey(credentialsId: 'node-app', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'ubuntu')]) {
          sh  'ls -alh'
          sh 'ssh ubuntu@192.168.2.213 -oStrictHostKeyChecking=no docker pull 776487083560.dkr.ecr.us-east-1.amazonaws.com/project-code-786:${BUILD_NUMBER}'
          sh 'ssh ubuntu@192.168.2.213 -oStrictHostKeyChecking=no docker run -itd -p8080:8080 --name nodeapp 776487083560.dkr.ecr.us-east-1.amazonaws.com/project-code-786:${BUILD_NUMBER}'
}
}
}



}
}

