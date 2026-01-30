FROM quay.io/fedora/fedora-bootc:43@sha256:730daf43f03922d1389e7959a0cf587bf2434779b6351ae91aaab06d41146e52
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
