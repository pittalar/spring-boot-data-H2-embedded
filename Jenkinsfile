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

        stage('Test Deploy') {
	      when {
                anyOf { branch 'devlop'; }
            }			      
            steps {
                echo 'Deploying....'
            }
        }
	stage('Stag Deploy') {
	when {
		      anyOf { branch 'release'; }
       }

            steps {
                echo 'Deploying....'
            }
        }
	stage('Prod Deploy') {
	when {
                anyOf { branch 'master'; }
            }
            steps {
                echo 'Deploying....'
            }
        }
    }
}
