FROM quay.io/fedora/fedora-bootc:44@sha256:000c49544a848013dfce7badde3421fd19b96c45f112ccc991e9794d6dbf9e1f
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
