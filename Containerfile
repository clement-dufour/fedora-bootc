FROM quay.io/fedora/fedora-bootc:44@sha256:3ec61e9a639d6e336f472987375c03eb476c4bdd68a63ed09a9d5cf8b7e76ba7
COPY image_files /

RUN \
    sed -i "s/enabled=1/enabled=0/" \
        /etc/yum.repos.d/fedora-updates-archive.repo \
        /etc/yum.repos.d/fedora-cisco-openh264.repo \
    && \
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
