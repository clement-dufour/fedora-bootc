FROM quay.io/fedora/fedora-bootc:43@sha256:4e4d3317bec3c70a33f6dbdc425ab6470234384e6ec3b8a531b266d2441d896d
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
