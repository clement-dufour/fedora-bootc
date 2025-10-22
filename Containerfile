FROM quay.io/fedora/fedora-bootc:42@sha256:7ff56572cecea43329019e677e3ca2c1a912b7c99d3697f7a7cdc1136c2a861a
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
