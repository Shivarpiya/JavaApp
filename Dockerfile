FROM tomcat
LABEL maintainer='venkatesh singu'
RUN rm -rf /usr/local/tomcat/webapps/*
#copying
COPY target/**.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"] 
