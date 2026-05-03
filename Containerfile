FROM quay.io/fedora/fedora-bootc:43@sha256:62b3ca1017c1b882bd4bdebe20818e3e051eeedf0540437630b66e8cdf02cb04
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
