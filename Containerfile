FROM quay.io/fedora/fedora-bootc:43@sha256:f3d8993ba7d3b5597ce052fa7cd12338a8ce102e626b96a54cd584e684f37b43
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
