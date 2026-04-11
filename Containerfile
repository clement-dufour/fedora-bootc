FROM quay.io/fedora/fedora-bootc:43@sha256:b60271645aacea966f28de8180cb4c71c14479c7d5344c21e0bfc332f3e68e0a
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
