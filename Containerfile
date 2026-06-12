FROM quay.io/fedora/fedora-bootc:44@sha256:cbfb036f42e4b99ff06738c889da54653e46145608da010d7abe962a6bd47116
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
