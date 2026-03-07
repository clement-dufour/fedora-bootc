FROM quay.io/fedora/fedora-bootc:43@sha256:e55429d36c8e090bc372eedb67522e5fcf40dc7c3d7536dfc429ae4125be5c11
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
