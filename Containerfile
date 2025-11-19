FROM quay.io/fedora/fedora-bootc:43@sha256:658d1dc7924f192dcaa5e1d9c6f86d3c4667f41d9dede5e553a9cac24306d3d2
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
