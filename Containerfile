FROM quay.io/fedora/fedora-bootc:43@sha256:3a198be3b16dc2e24e92f03d5ed4df984a7d454abfb38190fbedd421723e43e3
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
