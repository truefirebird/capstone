pipeline {
  environment {
    registry = "anandraman7978/testblueimage"
    registryCredential = 'anandraman7978'
     
  }
  agent any
 
  stages {
    stage ('Initialize') {
      steps {
        sh '''
        chmod 777 pipelint.sh
        ./pipelint.sh'''
      }
    }
    
    stage('Cloning Git') {
      steps {
        git 'https://github.com/anandraman7978/capstone.gi'
      }
    }
    
    stage('Build Docker Image Blue') {
   steps {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'anandraman7978', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
     sh '''
       cd blue
       chmod 777 run_docker.sh
      ./run_docker.sh '''
    }
   }
  }
    stage('Build Docker Image Green') {
   steps {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'anandraman7978', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
     sh '''
       cd green
       chmod 777 run_docker.sh
      ./run_docker.sh '''
    }
   }
  }
    stage('Deploy Image Blue') {
        steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'anandraman7978', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
     sh '''
        cd blue
        chmod 777 upload_docker.sh
        ./upload_docker.sh'''
    
    }
    }
    }
    stage('Deploy Image Green') {
        steps {
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'anandraman7978', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
     sh '''
        cd green
        chmod 777 upload_docker.sh
        ./upload_docker.sh'''
    
    }
    }
    }
    stage('Create Replication Controller Blue') {
        steps {
             withAWS(region:'us-west-2', credentials:'aws-static') {
            sh '''
            cd blue
            chmod 777 run_kubernetes.sh
            ./run_kubernetes.sh '''
             }
        }
    }
      stage('Create Replication Controller Green') {
        steps {
             withAWS(region:'us-west-2', credentials:'aws-static') {
            sh '''
            cd green
            chmod 777 run_kubernetes.sh
            ./run_kubernetes.sh '''
             }
        }
    }
    stage('Change Service Blue') {
        steps {
             withAWS(region:'us-west-2', credentials:'aws-static') {
            sh '''
            cd blue
            chmod 777 run-kube-serv.sh
            ./run-kube-serv.sh 
            kubectl get services
            '''
             }
        }
    }
    stage('Sanity check') {
            steps {
                input "Does the staging environment look ok?"
            }
        }
    stage('Change Service Green') {
        steps {
             withAWS(region:'us-west-2', credentials:'aws-static') {
            sh '''
            cd green
            chmod 777 run-kube-serv.sh
            ./run-kube-serv.sh 
            kubectl get services
            '''
             }
        }
    }

    
  }
}
