FROM quay.io/fedora/fedora-bootc:43@sha256:f804bd7a5c680b65e77ce7272cf0f04ca77e049f836df4e9added920fc733fcc
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
