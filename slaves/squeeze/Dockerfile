FROM cduez/squeeze:squeeze

# SSH
EXPOSE 22
RUN apt-get update
RUN apt-get -y install openssh-server sudo wget
RUN mkdir -p /var/run/sshd
RUN sed 's/UsePAM yes/UsePAM no/' -i /etc/ssh/sshd_config
RUN sed 's/#PermitRootLogin yes/PermitRootLogin yes/' -i /etc/ssh/sshd_config
RUN sed 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/' -i /etc/ssh/sshd_config
RUN /usr/sbin/sshd


RUN apt-get -y install build-essential

RUN useradd -m -d /var/lib/jenkins jenkins
RUN echo 'root:1111' | chpasswd
RUN echo 'jenkins:1111' | chpasswd
RUN su - jenkins -c "mkdir -p /var/lib/jenkins/.ssh"
ADD id_rsa /var/lib/jenkins/.ssh/
ADD id_rsa.pub /var/lib/jenkins/.ssh/
ADD known_hosts /var/lib/jenkins/.ssh/
ADD authorized_keys /var/lib/jenkins/.ssh/
RUN chown jenkins:jenkins -R /var/lib/jenkins/.ssh
RUN chmod 0700 /var/lib/jenkins/.ssh && chmod 0600 /var/lib/jenkins/.ssh/*


RUN sed 's/Defaults *requiretty/#Defaults    requiretty/' -i /etc/sudoers
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN apt-get -y install openjdk-6-jre-headless git

RUN su - jenkins -c "wget -O /var/lib/jenkins/swarm-client-1.9-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/1.9/swarm-client-1.9-jar-with-dependencies.jar"

#RUN su -c 'echo "127.0.0.1 localhost" > /etc/hosts'

ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
