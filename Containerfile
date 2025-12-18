FROM quay.io/fedora/fedora-bootc:43@sha256:a5d559d263d56233735b507503ce7ae8273693cbe4e87843f05bad8851a2668b
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
