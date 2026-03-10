FROM quay.io/fedora/fedora-bootc:43@sha256:f59a8f940a6ccb3b78d694aefa6d8cd0140d5bfeb6a98cc725a3393f101bcd61
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
