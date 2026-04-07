FROM quay.io/fedora/fedora-bootc:43@sha256:30ef5d8b43866e2764b54821dc5c48f33ba154b9bc3799730c9ae8ca9e2e3f69
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
