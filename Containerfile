FROM quay.io/fedora/fedora-bootc:43@sha256:6e924dcb8305ac6c8ecd7c09c5ffbfed54f9fe8310d5d30ed641484487abc064
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
