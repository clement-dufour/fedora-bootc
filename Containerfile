FROM quay.io/fedora/fedora-bootc:43@sha256:850575ab43ae474135fa91dbf10b3a208ceaf0168158cff45fe2b37d2ee11fe9
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
