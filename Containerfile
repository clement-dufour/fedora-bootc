FROM quay.io/fedora/fedora-bootc:43@sha256:ca10b82f03624c374eae5addf96c2acf36c569739832a5f5c14c29cddde2e7e3
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
