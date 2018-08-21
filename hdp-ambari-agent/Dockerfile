FROM reidddd/hdp-base
LABEL author "Amar Mesic"
LABEL version "0.1"

RUN apt-get update && apt-get install -y ambari-agent
RUN sed -i '/^hostname=.*$/c\hostname=ambari' /etc/ambari-agent/conf/ambari-agent.ini

# 'nproc' returns 4
RUN cat /etc/ambari-server/conf/ambari.properties | grep -v client.threadpool.size.max > /etc/ambari-server/conf/ambari.properties
RUN echo 'client.threadpool.size.max=4'

# Add startup scripts
ADD scripts/start.sh /root/scripts/ambari-agent-start.sh
ENTRYPOINT ["/root/scripts/ambari-agent-start.sh"]
