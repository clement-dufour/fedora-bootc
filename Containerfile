FROM quay.io/fedora/fedora-bootc:44@sha256:a82be3c2073890f0f7cd534b479b301d21aaa3a76630bdd9424d7615401f8dfa
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
