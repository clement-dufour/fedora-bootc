FROM quay.io/fedora/fedora-bootc:43@sha256:540939f0243bb28e173846ef3158a15015903d4fd2b11a57b60d1116928caa9c
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
