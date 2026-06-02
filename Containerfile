FROM quay.io/fedora/fedora-bootc:44@sha256:f6ad3e641ca297cd47e37c47820f7bb1d4f50997030dd42df11d28d43d6fd4d2
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
