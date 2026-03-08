FROM quay.io/fedora/fedora-bootc:43@sha256:45be5ff1ec19fdb9ab03510acb4a7ff2e7bb2243bc9300eba7bb14da18ac4ba2
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
