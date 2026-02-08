FROM quay.io/fedora/fedora-bootc:43@sha256:4f3ea088f81995433a5f30e50ecc69e49ab68c7647d95a145d8ad2d2bc0bd8f8
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
