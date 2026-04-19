FROM quay.io/fedora/fedora-bootc:43@sha256:3cbaf9ac765eb37474bf0b597b279c219cd6e7af9b919268702af8fb70f5a7c9
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
