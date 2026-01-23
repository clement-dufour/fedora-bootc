FROM quay.io/fedora/fedora-bootc:43@sha256:30d0a50a13fbe8e30dd9592d4e3af7f2ca2f0e78b65b10959a66d054bc807129
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
