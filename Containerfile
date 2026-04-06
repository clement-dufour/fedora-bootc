FROM quay.io/fedora/fedora-bootc:43@sha256:a2ab602d0861c0d832626c633eb98754e97b7b07c1738e927b012eb6f6969189
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
