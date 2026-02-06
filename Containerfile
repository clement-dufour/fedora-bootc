FROM quay.io/fedora/fedora-bootc:43@sha256:4121442b61b21566bf58b101f027bcd7d2a2269f32bd3b30d5c50a5d3cf90225
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
