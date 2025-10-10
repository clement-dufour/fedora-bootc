FROM quay.io/fedora/fedora-bootc:42@sha256:eda7c16c2c4e1567bb1f9fb0bd4b2d2e50304fec8956923f3b511c223d512cfb
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
