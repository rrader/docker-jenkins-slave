Jenkins-on-Vagrant-with-Docker-Slaves
=======================================

Prerequisites
-------------
 1. Vagrant

Optional (but is really recommended)

 1. vagrant-lxc plugin: `vagrant plugin install vagrant-lxc`
 2. vagrant-lxc related configuration on Host. See https://github.com/fgrehm/vagrant-lxc/wiki

Getting started
-------------
    $ git clone git@github.com:rrader/docker-jenkins-slave.git djs
    $ cd djs
    $ ./djs.sh up
    [lots of vagrant output ....]
    ==================================================
    Jenkins should be available on 10.0.3.74:8080
    Start using slaves with adding one
     e.g. # ./djs.sh add centos7-java Luke

Now you should be able to use your just deployed jenkins on http://10.0.3.74:8080 or similar

Now let's add some slaves with `./djs.sh add <image> <name>`

    $ ./djs.sh add centos7-java Luke
    Unable to find image 'antigluk/jenkins-slave-centos6-java' locally
    Pulling repository antigluk/jenkins-slave-centos6-java
    [lots of docker output ....]
    Status: Downloaded newer image for antigluk/jenkins-slave-centos6-java:latest
    507e2a18674253d0d7d1f5201ee963681704c2d18310af619f9fcbb0124efaf3
    Connection to 10.0.3.74 closed.

This will pull centos7-java image from Docker Hub and start it. After this command ends you should be able to see Luke worker in "Build Executor Status" section on Jenkins.


Notes [important]
============
Only centos6-java and centos7-java are ready to use now with Vagrant Jenkins


docker-jenkins-slave [DEPRECATED]
===================================
This section describes how to build and use slaves without Vagrant, as it were in version 1.x.

CentOS 5, 6, Suse12 and Debian Jenkins slaves based on Docker

Install
--------------------

1. Clone this repository
2. Install <a href="https://wiki.jenkins-ci.org/display/JENKINS/Swarm+Plugin">Swarm Plugin</a> to your Jenkins
3. Go to subfolder of desired slave OS (centos5, squeeze etc)
4. Do `$ sudo bash build.sh`

Usage
--------------------

1. Go to subfolder of desired slave OS (centos5, squeeze etc), again
2. Do `$ sudo bash add_slave.sh SlaveName` (it assumes that docker machine sees host as 172.17.42.1)
3. In Jenkins now you should see new slave, modify or create new job and specify tag `docker-<tagname>` (see list of tagnames <a href="https://github.com/antigluk/docker-jenkins-slave/wiki/Tags">on wiki</a>)
