FROM quay.io/fedora/fedora-bootc:43@sha256:550cf54abdf065f2fb0f1a67c8ae9f24b1887914216b1a41fe11b6e235734e84
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
