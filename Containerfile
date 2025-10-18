FROM quay.io/fedora/fedora-bootc:42@sha256:5d1abbeead4de6ce1f2d10eb0b4b729ebc5b4164d66f6baac921dc4e2f0760c4
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
