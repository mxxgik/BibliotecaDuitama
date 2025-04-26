FROM tomcat:latest
COPY target/bibliotecamunicipal.war webapps/ROOT.war
EXPOSE 8080
CMD [ "catalina.sh", "run" ]
