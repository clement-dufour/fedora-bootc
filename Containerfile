FROM quay.io/fedora/fedora-bootc:43@sha256:b3e8b017c1e3fbb8e594e48e72138d1c66897fd338f92aad3d6ae3cb7eecf593
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
