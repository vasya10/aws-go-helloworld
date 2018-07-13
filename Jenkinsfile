pipeline {
  agent {
    docker {
      image 'go-builder:latest'
    }
  }

  options {
    disableConcurrentBuilds()
    buildDiscarder(logRotator(numToKeepStr: '5'))
    timeout(time: 30, unit: 'MINUTES')
    timestamps()
  }

  stages {
    stage('BUILD') {
      steps {
        sh 'GOPATH=$PWD && go get -d -v ./...'
        sh 'GOPATH=$PWD && go install -v ./...'
      }
    }

    stage('QA') {
      steps {
        echo "Future..."
      }
    }

    stage('PUBLISH') {
      steps {
        echo "Future..."
      }
    }
  }

  post {
    failure {
      echo "Build Failed"
    }
    success {
      echo "Build Success"
    }
    always {
      echo "Build Done"
    }
  }
}