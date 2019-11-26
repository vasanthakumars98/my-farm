FROM tomcat:latest
COPY target/my-farm.war /usr/local/tomcat/webapps/my-farm.war

