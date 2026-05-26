# Zero-to-Hero Workstation Provisioner

Suíte IaC que transforma Linux limpo ou WSL2 em estação de desenvolvimento completa: NVIDIA, Docker, compiladores C++, rede, Python versionado.

## Stack

- Ansible
- Terraform (opcional, cloud recursos)
- Bash

## Software instalado

| Categoria | Pacotes |
|-----------|---------|
| GPU | drivers NVIDIA, CUDA toolkit, nvidia-container-toolkit |
| Containers | Docker Engine, Docker Compose v2 |
| Build | gcc/g++, cmake, ninja, rustup |
| Python | pyenv, Python 3.11/3.12, poetry |
| Node | fnm, Node LTS |
| Rede | wireguard, dig, nmap, iperf3 |
| Dev | git, gh CLI, vim/neovim, tmux |
| Data | PostgreSQL client, redis-cli |

Lista completa por role: [docs/SOFTWARE_LIST.md](docs/SOFTWARE_LIST.md)

## Customização — variables.yml

```yaml
# group_vars/all.yml
install_nvidia: true
python_versions: ["3.11.9", "3.12.4"]
node_version: "20"
docker_users: ["{{ ansible_user }}"]
enable_wsl2: false
```

Copie `group_vars/all.example.yml` → `group_vars/all.yml`.

## Uso

```bash
# WSL2 ou Ubuntu 22.04+
./scripts/preflight.sh
ansible-playbook -i inventory/local.ini ansible/playbooks/workstation.yml
```

## Compatibilidade de hardware

| Cenário | Suporte |
|---------|---------|
| NVIDIA discrete GPU | Sim, driver 535+ |
| AMD GPU (ROCm) | Experimental — `install_rocm: true` |
| Sem GPU | `install_nvidia: false` |
| WSL2 | Sim, com kernel Microsoft e drivers Windows |
| Apple Silicon | Não — use playbook macOS separado (futuro) |

Avisos: [docs/HARDWARE.md](docs/HARDWARE.md)

## Estrutura

| Pasta | Função |
|-------|--------|
| `ansible/roles/` | nvidia, docker, python, etc. |
| `ansible/playbooks/` | workstation.yml |
| `terraform/` | opcional |
| `scripts/` | preflight, pós-install |
