FROM reidddd/hdp-base:latest
LABEL author="Amar Mesic"
LABEL version="0.1"

# Install packages
RUN apt-get update && apt-get install -y ambari-server && ambari-server setup -v -s

RUN sed -i 's/agent.package.install.task.timeout=1800/agent.package.install.task.timeout=100000/g' /etc/ambari-server/conf/ ambari.properties

EXPOSE 8080
ADD scripts/start.sh  /root/scripts/ambari-server-start.sh
CMD ["/root/scripts/ambari-server-start.sh"]
