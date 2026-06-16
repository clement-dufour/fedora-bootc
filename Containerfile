FROM quay.io/fedora/fedora-bootc:44
COPY image_files /

RUN \
    sed -i "/enabled=/s/1/0/" \
        /etc/yum.repos.d/fedora-updates-archive.repo \
        /etc/yum.repos.d/fedora-cisco-openh264.repo \
    && \
    dnf install --assumeyes \
        qemu-guest-agent \
    && \
    dnf install --assumeyes \
        systemd-container \
        vim \
    && \
    dnf clean all && \
    systemctl preset-all && \
    rm -r /var/* && \
    bootc container lint
