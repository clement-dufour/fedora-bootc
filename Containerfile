FROM quay.io/fedora/fedora-bootc:43@sha256:512d9408457fcc0724bd594b359ce7a5d3e73bf08f9c6f73426955f612aba010
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
