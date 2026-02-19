FROM quay.io/fedora/fedora-bootc:43@sha256:103bcf196a7f3bbec97f6c043d54075ea9e9010c18d4163ff236e13a79e7c60e
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
