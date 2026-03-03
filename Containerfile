FROM quay.io/fedora/fedora-bootc:43@sha256:3a47a9437d56d1a2f7c96ed423add8ee47d8008aa81c17639688636d0ee74f1a
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
