FROM quay.io/fedora/fedora-bootc:43@sha256:0288bd0133e0125e1ae0e2e21d381bf6e749e40ae47b8ed75061f2f1c530d118
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
