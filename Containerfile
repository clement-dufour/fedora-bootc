FROM quay.io/fedora/fedora-bootc:43@sha256:69b6a260efba5ee180fce21959665dcba4e6d360cfff166daf74a5b14ff418e9
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
