FROM centos:7

LABEL maintainer="Bigornoo bigornor@nowhere.com"


# Start pcloudCC
COPY files/ /root/

# Build pCloud CC
RUN useradd -m -d /pcloud -r -s /bin/false pcloudcc && chown pcloudcc:pcloudcc /pcloud
RUN \
    yum install -y zlib-devel.x86_64 boost-devel.x86_64 boost-static fuse-devel.x86_64 glibc-devel.x86_64 cmake gcc systemd-devel boost-system boost-program-options gcc-c++ && \
    mkdir -p /tmp/console-client && \
    git clone https://github.com/pcloudcom/console-client.git /tmp/console-client/ \
    && \
    cd /tmp/console-client/pCloudCC/lib/pclsync/ && \
    make clean && \
    make fs && \
    cd ../mbedtls/ && \
    cmake . && \
    make clean && \
    make && \
    cd ../.. && \
    cmake . && \
    make && \
    make install && \
    ldconfig && \
    rm -r /tmp/* && \
    yum clean all

