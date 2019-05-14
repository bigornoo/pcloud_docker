FROM centos:7

LABEL maintainer="Bigornoo bigornor@nowhere.com"


# Start pcloudCC
COPY files/ /root/

# Build the image with pcloud user
ARG PCLOUDUSER

# Build pCloud CC

RUN \
    yum install -y fuse redhat-lsb-core && \
    yum localinstall -y /root/pCloudCC-2.0.1.1-1.1.el7.jfoto.x86_64.rpm 
RUN \
    chmod +x /root/run.sh && \
    [[ ! -e /pcloud ]] && mkdir /pcloud && \
    chown root:root /pcloud
   
ENTRYPOINT ["/root/run.sh"]
