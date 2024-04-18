pipeline {
    agent any
    tools {
        maven 'maven3'
    }
    options {
        buildDiscarder logRotator(daysToKeepStr: '7', numToKeepStr: '7')
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Using withMaven step to execute Maven commands
                    withMaven(maven: 'maven3') {
                        sh 'mvn clean package'
                    }
                    archiveArtifacts artifacts: 'target/*.war', onlyIfSuccessful: true
                }
            }
        }
        stage('Upload War To Nexus') {
            steps {
                script {
                    // Using withMaven step to read Maven POM file
                    def mavenInfo = readMavenPom file: 'pom.xml'
                    def nexusRepoName = mavenInfo.version.endsWith("SNAPSHOT") ? "simpleapp-snapshot" : "simpleapp-release"
                    nexusArtifactUploader artifacts: [
                        [
                            artifactId: 'simple-app', 
                            classifier: '', 
                            file: "target/simple-app-${mavenInfo.version}.war", 
                            type: 'war'
                        ]
                    ], 
                    credentialsId: 'nexus3', 
                    groupId: 'in.javahome', 
                    nexusUrl: 'http://43.204.216.4:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: nexusRepoName, 
                    version: mavenInfo.version
                }
            }
        }
    }
}
