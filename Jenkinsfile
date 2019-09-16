pipeline {
  environment {
    registry = "anandraman7978/jenkins-docker2"
    registryCredential = 'anandraman7978'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/anandraman7978/blue_green_implementation'
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
      chmod 777 run_docker.sh
      ./run_docker.sh '''
    }
   }
  }
    stage('Deploy Image') {
        steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'anandraman7978', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
     sh '''
        chmod 777 upload_docker.sh
        ./upload_docker.sh'''
    
    }
    }
    }
    stage('Create Replication Controller') {
        steps {
             withAWS(region:'us-west-2', credentials:'aws-static') {
            sh '''
            chmod 777 run_kubernetes.sh
            ./run_kubernetes.sh '''
             }
        }
    }
    stage('Change Service') {
        steps {
             withAWS(region:'us-west-2', credentials:'aws-static') {
            sh '''
            chmod 777 run-kube-serv.sh
            ./run-kube-serv.sh 
            kubectl get services
            '''
             }
        }
    }

    
  }
}
