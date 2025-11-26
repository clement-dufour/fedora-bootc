FROM quay.io/fedora/fedora-bootc:43@sha256:658ff221fd62184a22b1f57fc5937124c5e0622ecf6a6dbbd6e979e23ad820db
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
