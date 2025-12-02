FROM quay.io/fedora/fedora-bootc:43@sha256:7b9740a9cbc86ce5050c4e13dca90055ca43f50548107074ccb62e5ebbd3d5f0
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
