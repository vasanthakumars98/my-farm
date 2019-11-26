pipeline {
    
    agent { 'label' 'java-build'}
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
       stage("deploy to QA-1"){
             steps{
                 sh "ansible-playbook install-war-QA1.yml"
            }

        }
       stage("build docker image for QA2"){
             steps{
                 sh "docker build -t my-farm:v1 ."
            }

        }
       stage("docker run on QA2"){
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

   }

}
