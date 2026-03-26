FROM quay.io/fedora/fedora-bootc:43@sha256:66a119b56c1948d1d4eb5bd1fc087206966ad2602da8b06c28a6fdd1eb741067
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
