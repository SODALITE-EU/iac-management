FROM ubuntu:kinetic
# Install OpenJDK-8
RUN apt-get update && \
#     apt-get install -y openjdk-8-jdk && \
    apt-get install -y openjdk-8-jre && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
# ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV JAVA_HOME=/usr/lib/jvm/default-java

RUN export JAVA_HOMEWORKDIR
ADD https://sodalite.s3-us-west-2.amazonaws.com/SkylineExtraction-0.0.1-SNAPSHOT.jar SkylineExtraction-0.0.1-SNAPSHOT.jar
RUN mkdir libs
ADD https://sodalite.s3-us-west-2.amazonaws.com/pl_optimized_model.pb libs/pl_optimized_model.pb
EXPOSE 8080
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "SkylineExtraction-0.0.1-SNAPSHOT.jar"]