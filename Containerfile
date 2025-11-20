FROM quay.io/fedora/fedora-bootc:43@sha256:b97f52eb3f6c7207d1160dd86a916a851d99aaebf0fb03de2caabfc89a5c887c
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
