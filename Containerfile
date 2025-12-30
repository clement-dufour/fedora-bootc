FROM quay.io/fedora/fedora-bootc:43@sha256:422f8d3f2f97f24905e56d5d14d56d00cb30fbcbd0980f49d229dc458305bbff
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
