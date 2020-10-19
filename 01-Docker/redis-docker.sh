#!/bin/bash
echo This shell will install Redis using Docker;
echo -n "Please Input Password:";
read pwd
mkdir -p /volume/redis/conf /volume/redis/data
systemctl start docker
if  [ ! -n "$pwd" ] ;then
echo "Password Is Null"
docker pull redis:5.0.8
docker run -d --name redis -p 6379:6379 -v /volume/redis/conf/redis.conf:/redis.conf -v /volume/redis/data:/data redis:5.0.8 redis-server --appendonly yes
else
docker pull redis:5.0.8
docker run -d --name redis -p 6379:6379 -v /volume/redis/conf/redis.conf:/redis.conf -v /volume/redis/data:/data redis:5.0.8 redis-server --appendonly yes  --requirepass $pwd
fi
echo "====================================="
echo "Install Success!!!"
echo ""
echo "You can find data: /volume/redis/data"
echo "You can find conf: /volume/redis/conf"
echo ""
echo "======================================"
