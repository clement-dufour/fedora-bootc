FROM quay.io/fedora/fedora-bootc:42@sha256:07775acef998a2a28cb4f76ac975186513f7718d345256955e5f644b8d1cbf77
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
