FROM quay.io/fedora/fedora-bootc:43@sha256:e96ce05bf735cbde01b4a849399fb7fac0476002a85ac31ac29bbe8fffad49cf
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
