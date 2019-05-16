FROM centos:7

LABEL maintainer="Bigornoo bigornor@nowhere.com"


# Build the image with pcloud user
ARG PCLOUDUSER

ARG IMAGE_TAG=latest

# Build pCloud CC

RUN \
    yum install -y fuse redhat-lsb-core   

# Start pcloudCC
COPY files/ /root/

RUN \
    yum localinstall -y /root/pCloudCC-2.0.1.1-1.1.el7.jfoto.x86_64.rpm && \
    chmod +x /root/run.bash && \
    [[ ! -e /pcloud ]] && mkdir /pcloud && \
    chown root:root /pcloud
   
ENTRYPOINT ["/root/run.bash"]
