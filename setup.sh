wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins java icedtea-web e2fsprogs git lxc tar bridge-utils

mkdir -p /var/lib/jenkins/plugins
cd /var/lib/jenkins/plugins
wget http://updates.jenkins-ci.org/latest/swarm.hpi
chown jenkins:jenkins swarm.hpi

chkconfig jenkins on
systemctl start jenkins

# ======================

yum install -y epel-release
yum install -y lxc lxc-templates

# ======================

for i in {0..6}
do
    mknod -m0660 /dev/loop$i b 7 $i
done

yum install -y docker

sed -i 's/OPTIONS=/#OPTIONS=/g' /etc/sysconfig/docker
echo 'OPTIONS=-H unix:// --exec-driver=lxc' >> /etc/sysconfig/docker

systemctl enable docker
systemctl start docker
