FROM quay.io/fedora/fedora-bootc:43@sha256:9aa313086c4d4c74e1aafd57792615fdce18e8f53519c9d88a284a8f85ce61ea
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
