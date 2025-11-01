FROM quay.io/fedora/fedora-bootc:43@sha256:73e9aa0bb38f55500a30787d37b0f09851765c53f9b0ef23f05240413a1c024c
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
