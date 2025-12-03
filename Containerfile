FROM quay.io/fedora/fedora-bootc:43@sha256:03e4f359c928ca4766bd4bfc2014768df8eeb1afd901370f698a0666a5a78acd
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
