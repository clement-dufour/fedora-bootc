FROM quay.io/fedora/fedora-bootc:43@sha256:841b1a202113e67c6e628a20d8ad49e5febc331f6e898f9016548390823be373
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
