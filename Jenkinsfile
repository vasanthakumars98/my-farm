pipeline {
    
    agent { 'label'}
    stages{

        stage("build-the-source-code"){
             steps{
                 sh "/usr/share/maven/bin/mvn clean install"
            }
        
        }
        stage("static code analyser"){
             steps{
                 sh "/usr/share/maven/bin/mvn verify sonar:sonar"
            }

        }
       stage("deploy to Environment QA-1"){
             steps{
                 sh "ansible-playbook install-war-QA1.yml"
            }

        }
       stage("build docker image for Enviroment QA2"){
             steps{
                 sh "docker build -t my-farm:v2 ."
            }

        }
       stage("docker run on Environement QA2"){
             steps{
                 //sh "docker run -d -P my-farm:v1"
                   sh "ansible-playbook  install-war-QA2-docker.yml"
            }

        }
       stage("run selenium test on QA"){
             steps{
                 echo "java -jar selenium-server.jar"
            }

        }
      stage(" Monitoring : check if server is up "){
           steps{
                
		sh "curl -L http://192.168.170.128:8080"

	   }
	}

   }

}
