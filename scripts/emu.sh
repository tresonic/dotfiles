#!/usr/bin/env bash

usage=$(cat << EOF

Usage: $0
    run <diskimage> <path to mount>
    runiso <diskimage> <isoimage>
    gen <diskimage> <size>

Mount in Guest:
sudo mkdir -p /mnt/9p && sudo mount -t 9p -o trans=virtio,version=9p2000.L host0 /mnt/9p
Workaround according to:
https://www.baeldung.com/linux/qemu-from-terminal
EOF
)

case $1 in
    run)
    qemu-system-x86_64 -enable-kvm -m 4G -smp 2 -hda "$2" -netdev user,id=net0,net=192.168.0.0/24,dhcpstart=192.168.0.9 -device virtio-net-pci,netdev=net0 -vga qxl -device AC97 -virtfs local,path="$3",mount_tag=host0,security_model=mapped,id=host0 -device virtio-serial-pci -spice port=5930,disable-ticketing=on -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0  -chardev spicevmc,id=spicechannel0,name=vdagent -display spice-app
    ;;
    runiso)
    qemu-system-x86_64 -enable-kvm -m 4G -smp 2 -hda "$2" -boot d -cdrom "$3" -netdev user,id=net0,net=192.168.0.0/24,dhcpstart=192.168.0.9 -device virtio-net-pci,netdev=net0 -vga qxl -device AC97    
    ;;
    gen) 
    qemu-img create -f qcow2 "$2" "$3"
    ;;
    *) echo "Unrecognized Option!" "$usage";;
esac
