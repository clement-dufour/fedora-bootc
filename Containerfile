FROM quay.io/fedora/fedora-bootc:43@sha256:aa4d8d4861f70e7e6edcfb0fb4460860db1ac95cd646375a9ed9101b38f1334e
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
