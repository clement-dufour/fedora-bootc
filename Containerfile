FROM quay.io/fedora/fedora-bootc:43@sha256:c76a0f17280e59db4b78b594d5c5c986c0ddd34d0b777a6366ff45fce9963595
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
