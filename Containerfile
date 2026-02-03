FROM quay.io/fedora/fedora-bootc:43@sha256:1a43fe60e1f5125572696a9f3560c41d445dcb9ce025245673d94a1a1f1f3a18
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
