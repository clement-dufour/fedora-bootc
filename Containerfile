FROM quay.io/fedora/fedora-bootc:43@sha256:01cb63a2bc823d68928c93d74deb876f551031c0437465fb85efbcf11979f780
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
