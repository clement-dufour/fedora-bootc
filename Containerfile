FROM quay.io/fedora/fedora-bootc:43@sha256:391c3bd6b6258586d7bfc7fa08d5c8e9f8240921b956c943abdb5b9eefe5cc8c
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
