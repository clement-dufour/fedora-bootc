FROM quay.io/fedora/fedora-bootc:43@sha256:c49a46440ad9df18fac6455f0e31d912afd284be4efdacfe8b42e292a01e174c
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
