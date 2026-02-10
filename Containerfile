FROM quay.io/fedora/fedora-bootc:43@sha256:151faf9aa94a779835a4f40bc949b192e56d42c1d539c83ca27745c73598763f
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
