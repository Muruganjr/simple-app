pipeline {
    agent any
    
    tools {
        maven 'maven3'
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Upload War To Nexus') {
            steps {
                script {
                    def mavenInfo = sh(script: 'mvn help:evaluate -Dexpression=project.version -q -DforceStdout', returnStdout: true).trim()
                    nexusArtifactUploader(
                        artifacts: [
                            [
                                artifactId: 'simple-app', 
                                classifier: '', 
                                file: 'target/simple-app-' + mavenInfo + '.war', 
                                type: 'war'
                            ]
                        ], 
                        credentialsId: 'nexus-cre', 
                        groupId: 'in.javahome', 
                        nexusUrl: '43.204.216.4:8081', 
                        nexusVersion: 'nexus3', 
                        protocol: 'http', 
                        repository: 'simpleapp-snapshot', 
                        version: mavenInfo
                    )
                }
            }
        }
    }
}
