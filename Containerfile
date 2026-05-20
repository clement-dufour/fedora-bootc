FROM quay.io/fedora/fedora-bootc:44@sha256:a999ba981d2d374b08eb831db6ae63e729d1600a046a0395cac60cdda29282f5
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
