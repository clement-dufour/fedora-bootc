FROM quay.io/fedora/fedora-bootc:43@sha256:07f1f0c87a62eb85eb66096a7460cbceba62f87ed6aee970ea2be1be5245e920
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
