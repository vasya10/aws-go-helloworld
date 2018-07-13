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
        sh 'go install'
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