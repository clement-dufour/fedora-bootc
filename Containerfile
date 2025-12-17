FROM quay.io/fedora/fedora-bootc:43@sha256:38d638110d8a04c58616407e56e9749a2cd1432d4320ad7b17528278ffc50ad7
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
