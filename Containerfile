FROM quay.io/fedora/fedora-bootc:44@sha256:1ed7c0aea29cea4f25c31656fcc4fc55bc2ef8ae8db0b6fc2264332e60abb327
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
