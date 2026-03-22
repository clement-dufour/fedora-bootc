FROM quay.io/fedora/fedora-bootc:43@sha256:b4d765f9c2277ec659c68df1c6c78aa9a541c42d724e3aa5c204324f098f7664
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
