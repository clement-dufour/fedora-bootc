FROM quay.io/fedora/fedora-bootc:44
COPY image_files /

RUN --mount=type=tmpfs,target=/var << 'EOF'
set -e -o nounset -o pipefail
set -x

sed -i "/enabled=/s/1/0/" \
    /etc/yum.repos.d/fedora-updates-archive.repo \
    /etc/yum.repos.d/fedora-cisco-openh264.repo \


dnf install --assumeyes \
    qemu-guest-agent \


dnf install --assumeyes \
    git \
    systemd-container \
    vim \


dnf clean all

systemctl preset-all
EOF
