FROM quay.io/fedora/fedora-bootc:43@sha256:7a3e3a86a9855b98eda7f9c905ee569d9087b95c6ae782dfb95ad6af9e6f800b
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
