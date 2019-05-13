FROM centos:7

LABEL maintainer="Bigornoo bigornor@nowhere.com"


# Start pcloudCC
COPY files/ /bot/

# Build pCloud CC
RUN useradd -m -d /pcloud -r -s /bin/false bot && chown bot:bot /pcloud && chown -R bot:bot /bot
RUN \
    yum install -y fuse redhat-lsb-core && yum localinstall -y https://github.com/bigornoo/console-client/blob/master/pCloudCC-2.0.1.1-1.1.el7.jfoto.x86_64.rpm
   

