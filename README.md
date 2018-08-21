Dockerfiles and Docker Compose for setting up an multi-node HDP Cluster with Ambari 2.6. Docker images are based on Ubuntu 16.04. Optionally, you can boostrap HDP installation with Ambari blueprints.

Requires Docker > v1.13 and Docker Compose > v1.17

## Build images

1. Build HDP Base Image
```
cd hdp-base
docker build -t reidddd/hdp-base:latest .
```

2. Build Ambari Agent Image
```
cd hdp-ambari-agent
docker build -t reidddd/hdp-ambari-agent:latest .
```

3. Build Ambari Server Image
```
cd hdp-ambari-server
docker build -t reidddd/hdp-ambari-server:latest .
```

## Run Docker Compose
To start containers, use Docker Compose
```
docker-compose up -d
```
It will take about a minute until Ambari is available on port 8080

## Passwords

Admin/Database password for all services is `hadoop`

