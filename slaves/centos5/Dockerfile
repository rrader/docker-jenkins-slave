FROM    centos:centos5

# Enable EPEL
RUN     rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm

# SSH
EXPOSE 22
RUN yum -y groupinstall "Development tools"
RUN yum -y install rsyslog openssh-server screen passwd java-1.6.0-openjdk sudo wget git python26
RUN sed 's/UsePAM yes/UsePAM no/' -i /etc/ssh/sshd_config
RUN sed 's/#PermitRootLogin yes/PermitRootLogin yes/' -i /etc/ssh/sshd_config
RUN sed 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/' -i /etc/ssh/sshd_config

RUN /etc/init.d/sshd restart


RUN adduser -d /var/lib/jenkins jenkins
RUN echo 'root:1111' | chpasswd
RUN echo 'jenkins:1111' | chpasswd
RUN su - jenkins -c "mkdir /var/lib/jenkins/.ssh"
ADD id_rsa /var/lib/jenkins/.ssh/
ADD id_rsa.pub /var/lib/jenkins/.ssh/
ADD known_hosts /var/lib/jenkins/.ssh/
ADD authorized_keys /var/lib/jenkins/.ssh/
RUN chown jenkins:jenkins -R /var/lib/jenkins/.ssh
RUN chmod 0700 /var/lib/jenkins/.ssh && chmod 0600 /var/lib/jenkins/.ssh/*


RUN sed 's/Defaults *requiretty/#Defaults    requiretty/' -i /etc/sudoers
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN su - jenkins -c "wget -O /var/lib/jenkins/swarm-client-1.9-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/1.9/swarm-client-1.9-jar-with-dependencies.jar"

#RUN touch /etc/hosts; echo "127.0.0.1	localhost" >> /etc/hosts

# Fix /dev/fd
#RUN ln -s /proc/self/fd /dev/fd

ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
