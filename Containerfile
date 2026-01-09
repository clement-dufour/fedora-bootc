FROM quay.io/fedora/fedora-bootc:43@sha256:eb97d5c3fa9bac2733e1e367515a9a28986873f34618a56c27b8e1a3ebce7522
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
