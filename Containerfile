FROM quay.io/fedora/fedora-bootc:43@sha256:46455c5a34ab6778183d94fc03dfbc926638e855ac77f6111ea26eebd48c941e
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
