#!/bin/bash
echo This script will install MySQL using Docker;
echo -n "Please Input Root Password:";
read rootpwd;
mkdir -p /volume/mysql/data /volume/mysql/conf /volume/mysql/logs
systemctl start docker
docker pull mysql:5.7
docker run -p 3306:3306 --name mysql -v /volume/mysql/conf:/etc/mysql/conf.d -v /volume/mysql/logs:/logs -v /volume/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$rootpwd -d mysql:5.7

echo "====================================="
echo "Install Success!!!"
echo ""
echo "You can find data: /volume/mysql/data"
echo "You can find logs: /volume/mysql/logs"
echo "You can find conf: /volume/mysql/conf"
echo ""
echo "Now! You can use mysql -uroot -p$rootpwd"
echo "======================================"
docker exec -it $(docker ps | grep mysql | awk '{print $1}') bash
