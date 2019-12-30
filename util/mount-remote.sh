#!/bin/bash
# Mounts a directory from a remote system using SSHFS

umount -f ./remote/

sshfs -o allow_other,defer_permissions pi@192.168.1.119:/home/pi/ ./remote/
