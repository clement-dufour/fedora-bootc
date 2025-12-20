FROM quay.io/fedora/fedora-bootc:43@sha256:494acbe209f9d5c0bf2d5f16e011e552387b0beda2cfc040fc0be94c1706137a
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
