FROM quay.io/fedora/fedora-bootc:43@sha256:04e6dd46f72930088b3dc3cf8b941faf2897530d48978801b7f9ab061c0ad736
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
