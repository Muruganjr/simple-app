pipeline {
    agent any
    tools {
        maven 'maven3'
    }
    
    stages {
        stage('Build') {
            script {
                withMaven(maven: 'maven3') {
                    sh 'mvn clean package'
            }
        }
    }
}
