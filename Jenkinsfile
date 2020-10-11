String projectFile = "pom.xml"
def dockerImage

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
	agent { dockerfile true }
	      when {
                anyOf { branch 'master'; }
            }			      
            steps {
                echo 'Deploying....'
            }
        }
	
	
    }
}
