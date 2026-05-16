FROM quay.io/fedora/fedora-bootc:44@sha256:fd37687b57230e10f6313293072d315236a1869959e639dd1511598a0371ba07
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
