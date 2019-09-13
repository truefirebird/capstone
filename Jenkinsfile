pipeline {
  environment {
    registry = "anandraman7978/jenkins-docker"
    registryCredential = 'anandraman7978'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/anandraman7978/capstone.git'
      }
    }
    stage ('Initialize') {
      steps {
        echo 'Placeholder.'
      }
    }
    stage('Build Docker Image') {
   steps {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'anandraman7978', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
     sh '''
      docker build -t anandraman7978/jenkins-docker:$BUILD_ID .
     '''
    }
   }
  }
    stage('Deploy Image') {
        steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'anandraman7978', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
     sh '''
      docker login -u anandraman7978 -p Panther@12
      docker push anandraman7978/jenkins-docker:$BUILD_ID
     '''
    
    }
    }
    }
   
        

    
  }
}
