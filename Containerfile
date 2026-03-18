FROM quay.io/fedora/fedora-bootc:43@sha256:a48a8bca67dd0cc9a520a05a2625103c2ac99bbb0dae404010a53a8f22ad85bf
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
