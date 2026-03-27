FROM quay.io/fedora/fedora-bootc:43@sha256:704dd81ddbed5b8f02caff7a83e22ed8b17ef7d3765cc76162a7f3f139488a70
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
