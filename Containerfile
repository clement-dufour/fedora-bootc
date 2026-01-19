FROM quay.io/fedora/fedora-bootc:43@sha256:d80f2c08a48e1fdf9a8cd5863ee979456b5bb232a8e40d70aa984f69c3d50d55
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
