FROM quay.io/fedora/fedora-bootc:43@sha256:f25e9768f429487255eec9bb566519414eb2e80048fa069964346b0938019c92
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
