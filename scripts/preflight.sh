#!/usr/bin/env bash
set -euo pipefail

echo "=== Zero-to-Hero Preflight ==="
command -v ansible-playbook >/dev/null || { echo "Instale Ansible"; exit 1; }
if [[ -f group_vars/all.yml ]]; then
  echo "group_vars/all.yml OK"
else
  echo "Copie group_vars/all.example.yml para group_vars/all.yml"
  exit 1
fi
echo "Preflight OK"
