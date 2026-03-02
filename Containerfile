FROM quay.io/fedora/fedora-bootc:43@sha256:2f38e944fa12eef566def3660b4301f24c2c481f70f04d0969ebdb3e72f6ef15
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
