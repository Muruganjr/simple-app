pipeline {
    agent any

    stages {
        stage('Build') {
            script {
                withMaven(maven: 'maven3') {
                    sh 'mvn clean package'
            }
        }
    }
}
