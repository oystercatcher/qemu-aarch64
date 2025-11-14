#!/bin/bash
#
# Alpine Linux AArch64  on  fedora x86_64  hardware
#

qemu-system-aarch64 \
    -name "Alpine Linux AArch64" \
    -machine type=virt,iommu=smmuv3 \
    -rtc base=utc \
    -m 4096     \
    -display none	\
    -serial mon:stdio	\
    -accel tcg \
    -cpu cortex-a57 \
    -drive if=pflash,format=raw,file="/usr/share/edk2/aarch64/QEMU_EFI-pflash.raw",readonly=on \
    -drive if=pflash,format=raw,file=AAVMF_VARS.fd \
    -drive file="alpine.qcow2",if=virtio,format=qcow2 \
    -drive file="alpine-virt-3.22.0-aarch64.iso",format=raw,readonly=on \
    -boot menu=on \
    -netdev user,id=unet,hostfwd=tcp::2222-:22    \
    -device virtio-net-pci,netdev=unet

# echo "QEMU has finished. Press Enter to continue."
# read throwaway


#    -display gtk \
#    -device virtio-vga \
#    -device qemu-xhci \
#    -device usb-kbd \
#    -device usb-tablet
#    -nic user,id=NAT,model=virtio-net-pci,mac=02:00:00:00:00:01 
