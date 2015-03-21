FROM    flavio/opensuse-12-3

# Enable EPEL
#RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

RUN zypper addrepo --no-gpgcheck http://download.opensuse.org/repositories/Java:/openjdk6:/Factory/SLE_11_SP2/Java:openjdk6:Factory.repo
RUN zypper addrepo --no-gpgcheck http://download.tizen.org/tools/latest-release/openSUSE_12.1/ tools

RUN zypper refresh
RUN zypper install -y git openssh sudo wget
RUN zypper install -y java-1_6_0-openjdk-devel

RUN sed 's/UsePAM yes/UsePAM no/' -i /etc/ssh/sshd_config
RUN sed 's/#PermitRootLogin yes/PermitRootLogin yes/' -i /etc/ssh/sshd_config
RUN sed 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/' -i /etc/ssh/sshd_config

RUN /etc/init.d/sshd restart

RUN useradd -md /var/lib/jenkins jenkins
RUN echo 'root:1111' | chpasswd
RUN echo 'jenkins:1111' | chpasswd
RUN su - jenkins -c "mkdir /var/lib/jenkins/.ssh"
ADD id_rsa /var/lib/jenkins/.ssh/
ADD id_rsa.pub /var/lib/jenkins/.ssh/
ADD known_hosts /var/lib/jenkins/.ssh/
ADD authorized_keys /var/lib/jenkins/.ssh/
RUN chown jenkins:users -R /var/lib/jenkins/.ssh
RUN chmod 0700 /var/lib/jenkins/.ssh && chmod 0600 /var/lib/jenkins/.ssh/*

RUN sed 's/Defaults *requiretty/#Defaults    requiretty/' -i /etc/sudoers
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN su - jenkins -c "wget -O /var/lib/jenkins/swarm-client-1.9-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/1.9/swarm-client-1.9-jar-with-dependencies.jar"

#RUN sed -i "s/^127.0.0.1/127.0.0.1 $(hostname) /" /etc/hosts

ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
