#!/bin/bash

WSL_CONF="/etc/wsl.conf"

if [ -f "$WSL_CONF" ]; then
    if grep -q "systemd=false" "$WSL_CONF"; then
        sudo sed -i 's/systemd=false/systemd=true/' "$WSL_CONF"
        echo "Updated 'systemd=false' to 'systemd=true'."
    elif ! grep -q "systemd=" "$WSL_CONF"; then
        echo -e "\n[boot]\nsystemd=true" | sudo tee -a "$WSL_CONF"
        echo "Added 'systemd=true' to existing /etc/wsl.conf."
    else
        echo "No changes needed. systemd already enabled or configured."
    fi
else
    echo -e "[boot]\nsystemd=true" | sudo tee "$WSL_CONF"
    echo "Created /etc/wsl.conf with 'systemd=true'."
