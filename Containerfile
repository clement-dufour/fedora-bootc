FROM quay.io/fedora/fedora-bootc:43@sha256:e0c99743d981f0c11ebf4f80f4d9f4e5830d9051adafabd88a72b2ac2bf7e02e
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
