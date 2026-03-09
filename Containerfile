FROM quay.io/fedora/fedora-bootc:43@sha256:90bd18a83203bdadf386cef00a0cd1fdcd52c4bc8224d43999176a1e50e92dcc
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
