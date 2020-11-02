FROM tomcat:8.5.47-jdk8-openjdk
#FROM tomcat:latest

COPY *.war /usr/local/tomcat/webapps/
