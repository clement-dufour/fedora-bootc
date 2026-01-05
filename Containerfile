FROM quay.io/fedora/fedora-bootc:43@sha256:f9ecbf7fa768058d2ed7158c82e77553a15eb4e48b046e1e5372925325d9276b
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
