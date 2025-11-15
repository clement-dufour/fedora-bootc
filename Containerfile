FROM quay.io/fedora/fedora-bootc:43@sha256:cb64c015695197aa07797fd512374d384433d4709bff9db34544c64ac6416deb
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
