docker-jenkins-slave
====================

CentOS 5, 6, Suse12 and Debian Jenkins slaves based on Docker

Install
--------------------

1. Clone this repository
2. Install <a href="https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin">Swarm Plugin</a> to your Jenkins
3. Go to subfolder of desired slave OS (centos5, squeeze etc)
4. Do `$ sudo bash build.sh`

Using
--------------------

1. Go to subfolder of desired slave OS (centos5, squeeze etc), again
2. Do `$ sudo bash add_slave.sh SlaveName` (it assumes that docker machine sees host as 172.17.42.1)
3. In Jenkins now you should see new slave, modify or create new job and specify tag `docker-<tagname>` (see list of tagnames below)

Tags
--------------------
 
 `<folder_name> (in this repo) : <Tag name>`
 
  - centos6 : `centos6.4`
  - centos5 : `centos5.4`
  - suse12 : `suse12.1`
  - squeeze : `debian6`
  
