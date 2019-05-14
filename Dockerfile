FROM centos:7

LABEL maintainer="Bigornoo bigornor@nowhere.com"


# Start pcloudCC
COPY files/ /root/


# Build pCloud CC

RUN \
    yum install -y fuse redhat-lsb-core && \
    yum localinstall -y /root/pCloudCC-2.0.1.1-1.1.el7.jfoto.x86_64.rpm 
RUN \
    chmod +x /root/run.sh
   
ENTRYPOINT ["/root/run.sh"]
