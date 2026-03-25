FROM quay.io/fedora/fedora-bootc:43@sha256:b089d41b023364901ceda72970d35e31c8293c66e6ed3c168d7e2853246f8170
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
