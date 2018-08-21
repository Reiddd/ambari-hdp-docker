FROM reidddd/hdp-base:latest
LABEL author="Amar Mesic"
LABEL version="0.1"

# Install packages
RUN apt-get update && apt-get install -y ambari-server && ambari-server setup -v -s

# 'nproc' returns 4
RUN cat /etc/ambari-server/conf/ambari.properties | grep -v client.threadpool.size.max > /etc/ambari-server/conf/ambari.properties
RUN echo 'client.threadpool.size.max=25' >> /etc/ambari-server/conf/ambari.properties

EXPOSE 8080
ADD scripts/start.sh  /root/scripts/ambari-server-start.sh
CMD ["/root/scripts/ambari-server-start.sh"]
