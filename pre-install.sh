#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
# http://redsymbol.net/articles/unofficial-bash-strict-mode/

echo "[*] Installing linux basics"
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y pipx curl git wget

echo "[*] Installing Pipx & Ansible"
pipx install ansible-core --force
pipx ensurepath
export PATH="$PATH:$HOME/.local/bin"

echo "[*] Installing Ansible Galaxy Collections"
ansible-galaxy install -r requirement.yml
echo "[*] All good, now run:"
echo "bash -x install.sh"
