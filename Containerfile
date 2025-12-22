FROM quay.io/fedora/fedora-bootc:43@sha256:03187194969f6cb3265307dcca6ffb78ce933fb3f2f807bec93a3ade5f353698
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
