FROM quay.io/fedora/fedora-bootc:43@sha256:36ae7b3b6e3e4f6e4b236deebdfe46bbe3f82a0beddacc2a44ef0dc3707e8fc5
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
