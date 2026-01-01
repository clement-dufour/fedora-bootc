FROM quay.io/fedora/fedora-bootc:43@sha256:e4d6d3fe46223c7d4f022e7914bacb2216abbd22ea118a10d5684807e2c29597
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
