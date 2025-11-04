FROM quay.io/fedora/fedora-bootc:43@sha256:b193a5166e08d74047c336b4161f6f6ecbca79ac7a238daeaad21a0d3a377a10
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
