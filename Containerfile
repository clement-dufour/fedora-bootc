FROM quay.io/fedora/fedora-bootc:43@sha256:6900a4839385842e8d0ac6d284c68519b667a3835b9a9e26a4f8b4d884999248
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
