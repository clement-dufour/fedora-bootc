FROM quay.io/fedora/fedora-bootc:43@sha256:59a830f6ef5f01ebf79abf3bc230c0b490aa8e13e1a34568ad7f155bf5485d95
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
