FROM thothbot/alpine-jre8 
COPY ./jartarget/myproject-0.0.1-SNAPSHOT.jar /myproject-0.0.1-SNAPSHOT.jar
#ADD ./run.sh /run.sh
#RUN chmod a+x /run.sh
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "/myproject-0.0.1-SNAPSHOT.jar" ]