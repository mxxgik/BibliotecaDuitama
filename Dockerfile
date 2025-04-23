FROM tomcat:latest
COPY target/bibliotecamunicipal.war webapps/
EXPOSE 8080
