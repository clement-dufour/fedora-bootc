FROM quay.io/fedora/fedora-bootc:43@sha256:d3e4bdec2ae93436922db83a29030a9dddfb15dea6ddb9d90a17381af25f43e4
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
