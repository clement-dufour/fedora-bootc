FROM quay.io/fedora/fedora-bootc:43@sha256:60615127b135050b795379f39f613dc10609fb880f4650339b5b0c332c7885ab
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
