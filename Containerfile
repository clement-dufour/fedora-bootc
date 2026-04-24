FROM quay.io/fedora/fedora-bootc:43@sha256:87c9d9a142c824c682ef776c119f9de8c5c22155f6d5546532ac93ab8c842c07
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
