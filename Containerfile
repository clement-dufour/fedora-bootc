FROM quay.io/fedora/fedora-bootc:43@sha256:45e8c4696c8bf059a6f403fa31cc1e29a2bc5bdc40302781a780ae913a6dc819
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
