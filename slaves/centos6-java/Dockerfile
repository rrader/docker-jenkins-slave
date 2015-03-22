FROM    centos:centos6

RUN yum -y install rsyslog wget tar java-1.7.0-openjdk java-1.7.0-openjdk-devel g++ gcc gcc-c++ libstdc++ make git bzip2

## RHEL/CentOS 6 64-Bit ##
RUN wget -O /tmp/epel.rpm http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm; rpm -ivh /tmp/epel.rpm

RUN wget -O /root/swarm-client.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/1.9/swarm-client-1.9-jar-with-dependencies.jar


RUN wget -O /opt/maven.tar.gz http://www.eu.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz

RUN cd /opt; tar -xvf maven.tar.gz; mkdir -p /root/.m2; ln -s /opt/apache-maven-3.2.5/bin/mvn /usr/bin

ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk.x86_64
ENV MAVEN_HOME /opt/apache-maven-3.2.5

ENTRYPOINT ["java", "-jar", "/root/swarm-client.jar", "-master", "http://172.17.42.1:8080", "-mode", "exclusive", "-executors", "1", "-fsroot", "/root"]
CMD ["-labels", "docker-centos6-java", "-name", "Chewbakka"]
