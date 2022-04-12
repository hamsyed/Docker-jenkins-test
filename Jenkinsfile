pipeline {
    agent any

    stages {
        stage('Git Cloning') {
            steps {
                git branch: 'main', url: 'https://github.com/hamsyed/Docker-jenkins-test.git'
            }
        }
        stage('Build Images'){
            steps{
            sh''' docker build -t hameed1983/${JOB_NAME}.${BUILD_ID}:v1 .
                docker tag hameed1983/${JOB_NAME}.${BUILD_ID}:v1  hameed1983/${JOB_NAME}.${BUILD_ID}:v1
                docker tag hameed1983/${JOB_NAME}.${BUILD_ID}:v1 hameed1983/${JOB_NAME}.${BUILD_ID}:latest
                '''
            }
        }
        
        stage('push image to dockerhub'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker-token', passwordVariable: 'dockerpassword', usernameVariable: 'dockerusername')]) {
    // some block          
                 sh'''docker login -u ${dockerusername} -p ${dockerpassword}
                      docker push  hameed1983/${JOB_NAME}.${BUILD_ID}:v1
                      docker push hameed1983/${JOB_NAME}.${BUILD_ID}:latest '''
                   }
            
            }
        }    
        stage('deploying the container'){
            steps{
              sshagent(['ec2-user-docker']) {
               sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.6.193 'ls -al'"
              }
            }
        }    
    }   
}
