FROM quay.io/fedora/fedora-bootc:43@sha256:28ebf7e383057f979bc7fc55f5e783c3580ee836231c1cd1c9beae6ed1eea186
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
