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
                nexusArtifactUploader artifacts: [
                    [
                        artifactId: 'simple-app', 
                        classifier: '', 
                        file: 'target/3.0.0-SNAPSHOT.war', 
                        type: 'war'
                    ]
                ], 
                credentialsId: 'nexus-cre', 
                groupId: 'in.javahome', 
                nexusUrl: '43.204.216.4:8081', 
                nexusVersion: 'nexus3', protocol: 'http', 
                repository: 'http://43.204.216.4:8081/repository/simpleapp-snapshot/', 
                version: '3.0.0-SNAPSHOT'
            }
        }
    }
}
