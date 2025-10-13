FROM quay.io/fedora/fedora-bootc:42@sha256:b1d637d819e1fb475cf1dff661edf3cff37789c38c90a109b22c92b5d2a96ebe
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
