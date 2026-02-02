FROM quay.io/fedora/fedora-bootc:43@sha256:9b1e76afc497f9a5f260d59fb8e3efba930e965643760811c8c5216d4694715d
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
