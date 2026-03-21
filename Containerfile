FROM quay.io/fedora/fedora-bootc:43@sha256:8bc457e4ed309e2956d61248f955bd07dfc2b049111559d6e52b69404dcf996c
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
