nstall wget
yum install wget -y

# backup repo
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

cd /etc/yum.repos.d/

# wget from aliyun
wget http://mirrors.aliyun.com/repo/Centos-7.repo

mv Centos-7.repo CentOS-Base.repo

yum makecache

yum -y update
yum -y update


# install some tools
sudo yum install -y git vim gcc glibc-static telnet bridge-utils

# install docker
sudo yum remove docker \
docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-selinux \
docker-engine-selinux \
docker-engine

sudo yum install -y yum-utils \
device-mapper-persistent-data \
lvm2

sudo yum-config-manager \
--add-repo \
http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

sudo yum makecache fast

sudo yum install -y docker-ce

# start docker service
sudo systemctl start docker

docker -v

# add docker mirror
cd /etc/docker

cat>daemon.json<<EOF
{
"registry-mirrors": [
"https://docker.mirrors.ustc.edu.cn/"
]
}
EOF

sudo chmod 777 daemon.json

sudo systemctl restart docker

sudo docker run hello-world
