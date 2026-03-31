FROM quay.io/fedora/fedora-bootc:43@sha256:53829d163d685800b3223c216f0714d00051b8e585d2797defcfc4953dc120e5
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
