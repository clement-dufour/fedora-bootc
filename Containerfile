FROM quay.io/fedora/fedora-bootc:43@sha256:7a142510b072b96d4e3fd32d9725ceef5bc16d794e97fda00d812540fe01cfc7
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
