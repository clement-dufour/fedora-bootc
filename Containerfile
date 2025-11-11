FROM quay.io/fedora/fedora-bootc:43@sha256:a1164485e0a895d73118243805103407c2a9bad4c825fb27133b1ca7dfea5b37
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
