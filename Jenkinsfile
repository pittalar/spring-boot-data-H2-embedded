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
	
	      when {
                anyOf { branch 'master'; }
            }			      
            steps {
                echo 'Deploying....'
		    docker.withRegistry('https://registry.example.com','7e899a8d-def3-486b-ab4f-7f0a62d76d05') {
			    
			    def customImage = docker.build("rameshpi/spring-boot-data-h2-embedded")
			    /* Push the container to the custom Registry */
        
			    customImage.push()
		    }
            }
        }
	
	
    }
}
