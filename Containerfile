FROM quay.io/fedora/fedora-bootc:43@sha256:42983ec7e3b625f8182ee0e275b0cbd0ab95aafd97374f95afbaacc8452267ef
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
