FROM quay.io/fedora/fedora-bootc:43@sha256:3ef7269cc7134242c5e7d093d52da9f1fd8f18db067f3fa9f81d99a7dafa926c
COPY image_files /

RUN \
    dnf install --assumeyes \
        qemu-guest-agent \
    && \
    dnf install --assumeyes \
        vim \
    && \
    dnf clean all && \
    systemctl preset-all && \
    rm -r /var/* && \
    bootc container lint
