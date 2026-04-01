FROM quay.io/fedora/fedora-bootc:43@sha256:60900cb506936af583704955830c72de1d7fc2622a92a9a3039442871a798260
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
