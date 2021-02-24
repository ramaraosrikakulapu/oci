#!/bin/bash
printf "\n\n\n*** test v1 agt spec w/ docker\n\n"
#docker run --rm --env-file=k8s/example/gateway.env enterpriseconnect/agent:v1 > agt.log || cat agt.log
docker run --rm --env-file=k8s/example/gateway.env enterpriseconnect/agent:v1 -ver
printf "\n\n\n*** test v1beta agt spec w/ docker\n\n"
docker run --rm --env-file=k8s/example/gateway.env enterpriseconnect/agent:v1beta -ver

printf "\n\n\n*** test server+tls v1 plugin spec w/ docker\n\n"
#docker run --rm -d --name server-tls --env-file=k8s/example/server+tls.env enterpriseconnect/plugins:v1 && sleep 10 && docker logs server-tls 
docker run --rm -d --name server-tls --env-file=k8s/example/server+tls.env enterpriseconnect/plugins:v1 -ver 
printf "\n\n\n*** test client+vln v1 plugin spec w/ docker\n\n"
docker run --rm -d --name client-vln --env-file=k8s/example/client+vln.env enterpriseconnect/plugins:v1 -ver
