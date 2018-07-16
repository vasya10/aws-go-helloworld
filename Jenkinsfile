#!/usr/bin/groovy

@Library("mycpl") _

pipeline {
  agent {
    docker {
      image 'go-build-agent:latest'
    }
  }

  options {
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '5'))
    timeout(time: 30, unit: 'MINUTES')
    timestamps()
  }

  stages {
    stage('COMPILE') {
      steps {
        notifySlack status: 'BUILD', message: 'compiling helloworld server'
        sh 'make compile'
      }
    }

    stage('DOCKER') {
      steps {
        notifySlack status: 'BUILD', message: 'building docker image'
        sh 'make build'
      }
    }

    stage('QA') {
      steps {
        echo "Coming soon..."
      }
    }

    stage('PUBLISH') {
      steps {
        echo "Coming soon..."
      }
    }
  }

  post {
    failure {
      echo "Build Failed"
      notifySlack status: 'FAILURE', message: 'Build Failed'
    }
    success {
      echo "Build Success"
      notifySlack status: 'SUCCESS', message: 'Build Succeeded'
    }
    always {
      echo "Build Done"
    }
  }
}