FROM quay.io/fedora/fedora-bootc:43@sha256:c53faae8ea6b3d874f03bc96929c454b17a919a9051f8083355c19f3315c829f
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
