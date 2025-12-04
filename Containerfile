FROM quay.io/fedora/fedora-bootc:43@sha256:88c02d43511933ede7bc88ae2ab2b3eeb3c501109458af58d0eadc425b944fee
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
