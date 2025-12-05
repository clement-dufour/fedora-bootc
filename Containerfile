FROM quay.io/fedora/fedora-bootc:43@sha256:824ffaae496bc19ad39ab94ff4545e789dc4fc862e30f87036b5b0f2e0cc54ca
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
