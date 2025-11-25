FROM quay.io/fedora/fedora-bootc:43@sha256:226a1116a95ddbc05c8c36de1184acc28415887343b8685bd74f1351adbf2b03
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
