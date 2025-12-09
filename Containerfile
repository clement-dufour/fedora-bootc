FROM quay.io/fedora/fedora-bootc:43@sha256:49415a5a0bb48f858e22884b16e79c6b93a4ee8ff644c41a8d52b786f9aa0299
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
