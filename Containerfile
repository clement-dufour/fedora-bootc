FROM quay.io/fedora/fedora-bootc:43@sha256:e71dcfa52627f5b3d6da939639b56add0b5787536372d1d2e7684ce282c5573b
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
