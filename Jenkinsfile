pipeline {
    environment {
      registry = 'mawfia/swe645a1p2'
      registryCredential = 'dockerhub-mawfia'
    }
    agent {
        kubernetes {
            yamlFile 'agent.yml'
        }
    }
    stages {
        stage('build') {
            steps {
                  container('docker'){
                  sh 'docker build -t ${registry}:${BUILD_NUMBER} .'
                }
            }
        }
        stage('publish') {
            steps {
                container('docker'){
                    withDockerRegistry([credentialsId: "${registryCredential}", url: ""]) {
                          sh "docker push ${registry}:${BUILD_NUMBER}"
                      }
                }
            }
        }
        stage('deploy') {
            steps {
                container('helm'){
                    sh "helm upgrade ${JOB_NAME} --install --force --set version=1.0 ./spring"
                }
                echo 'Spring Deployment # ${BUILD_NUMBER} is complete!'
            }
        }
    }
}
