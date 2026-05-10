FROM quay.io/fedora/fedora-bootc:44@sha256:7daaad39fac6b23bcdfabd3cd09c3057b5884bee323b20424d04991766f1f382
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
