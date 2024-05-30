#!/usr/bin/env bash

usage=$(cat << EOF

Usage: $0
    run <diskimage>
    runiso <diskimage> <isoimage>
    gen <diskimage> <size>
EOF
)

case $1 in
    run)
    qemu-system-x86_64 -enable-kvm -m 4G -smp 2 -hda "$2" -netdev user,id=net0,net=192.168.0.0/24,dhcpstart=192.168.0.9 -device virtio-net-pci,netdev=net0 -vga qxl -device AC97    
    ;;
    runiso)
    qemu-system-x86_64 -enable-kvm -m 4G -smp 2 -hda "$2" -boot d -cdrom "$3" -netdev user,id=net0,net=192.168.0.0/24,dhcpstart=192.168.0.9 -device virtio-net-pci,netdev=net0 -vga qxl -device AC97    
    ;;
    gen) 
    qemu-img create -f qcow2 "$2" "$3"
    ;;
    *) echo "Unrecognized Option!" "$usage";;
esac
