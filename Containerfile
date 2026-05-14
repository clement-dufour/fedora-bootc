FROM quay.io/fedora/fedora-bootc:44@sha256:ec9fb918dfef9b86332335fc428d2aad05e9dc34ed70b5c4b220d3d1a5ea49cb
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
