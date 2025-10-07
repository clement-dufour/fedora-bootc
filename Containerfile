FROM quay.io/fedora/fedora-bootc:42@sha256:167b4a0f811a4fe46c19998f2181340dd514aba961aebe8d973b42d7b195645e
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
