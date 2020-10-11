String projectFile = "pom.xml"

pipeline {
def app
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
		app = docker.build("rameshpi/spring-boot-data-H2-embedded")
            }
        }
	
	
    }
}
