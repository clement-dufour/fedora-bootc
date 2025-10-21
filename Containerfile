FROM quay.io/fedora/fedora-bootc:42@sha256:fa9a1f1c439d0adee999b3ff8afb6ac36df598cf18da810ccb24240ef87afd7e
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
