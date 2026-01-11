FROM quay.io/fedora/fedora-bootc:43@sha256:50276457c22c23e676816644237e8d90725db0ab072bc613a72714dd88c1350b
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
