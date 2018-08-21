FROM ubuntu:16.04
LABEL author="Amar Mesic"
LABEL version="0.1"

# aliyun apt source
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# Setup repos and install pre-requisites
RUN apt-get update && apt-get install software-properties-common apt-utils wget ntp net-tools inetutils-ping curl ssh vim python telnet lsof less -y
RUN add-apt-repository ppa:webupd8team/java && apt-get update && apt-get install oracle-java8-installer oracle-java8-set-default -y

# Add HDP and Ambari repos
RUN wget -O /etc/apt/sources.list.d/ambari.list http://public-repo-1.hortonworks.com/ambari/ubuntu16/2.x/updates/2.6.0.0/ambari.list
RUN wget -O /etc/apt/sources.list.d/hdp.list http://public-repo-1.hortonworks.com/HDP/ubuntu16/2.x/updates/2.6.3.0/hdp.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B9733A7A07513CAD
RUN apt-get update

# Create directories
RUN mkdir /root/.ssh && mkdir /root/scripts && mkdir /root/config

# Set up SSH
ADD config/id_rsa /root/.ssh/id_rsa
ADD config/id_rsa.pub /root/.ssh/id_rsa.pub
ADD config/sshd_config /etc/ssh/sshd_config
RUN touch /root/.ssh/authorized_keys \
    && cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
    && chmod -R 600 /root/.ssh/
    
# 'nproc' returns 4
RUN cat /etc/ambari-server/conf/ambari.properties | grep -v client.threadpool.size.max > /etc/ambari-server/conf/ambari.properties
RUN echo 'client.threadpool.size.max=25' >> /etc/ambari-server/conf/ambari.properties

# shutdown ipv6
RUN echo 'net.ipv6.conf.all.disable_ipv6=1' >> /etc/sysctl.conf
RUN echo 'net.ipv6.conf.default.disable_ipv6=1' >> /etc/sysctl.conf

# Set up hosts
ADD config/hosts /etc/
CMD ["/bin/bash"]
