String projectFile = "pom.xml"

pipeline {
    agent any
	
	tools {
		maven 'Maven 3.6.3'
		jdk 'jdk8'
	    }
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
		    withMaven(maven : 'Maven 3.6.3')	{
		    	bat 'mvn clean install'
		    }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }

        stage('Docker Image') {
	      when {
                anyOf { branch 'master'; }
            }			      
            steps {
                echo 'Deploying....'
		    dockerBuildAndPublish {
			    repositoryName('rameshpi/spring-boot-data-H2-embedded')
			    tag('${BUILD_TIMESTAMP}-${GIT_REVISION,length=7}')
			    registryCredentials('7e899a8d-def3-486b-ab4f-7f0a62d76d05')
			    forcePull(false)
			    createFingerprints(false)
			    skipDecorate()
			}
            }
        }
	
	
    }
}
