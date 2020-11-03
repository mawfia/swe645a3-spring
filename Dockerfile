#507MB
FROM tomcat:8.5.47-jdk8-openjdk

#FROM tomcat:latest #648MB

COPY *.war /usr/local/tomcat/webapps/
