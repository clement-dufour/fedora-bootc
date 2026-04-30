FROM quay.io/fedora/fedora-bootc:43@sha256:9ba52a036a8c896c6236c15f3416bd4707d79c0ad087c5e4f380446243748b6f
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
