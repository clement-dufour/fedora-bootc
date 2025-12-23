FROM quay.io/fedora/fedora-bootc:43@sha256:181fe2609e25bab7863a51e7f386c05cbd95d6f909174e4c0ec9c95d0a5f1f4d
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
