FROM quay.io/fedora/fedora-bootc:43@sha256:2ea291797d86cf7c8c3f0e62a7993e247acc1dbd7ecc776608010c2684314618
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
