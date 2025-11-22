FROM quay.io/fedora/fedora-bootc:43@sha256:4a40f0d0a1b01cad30ae11287c73b7e315b35014ad8ca561d24f02b6d2e6ad0e
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
