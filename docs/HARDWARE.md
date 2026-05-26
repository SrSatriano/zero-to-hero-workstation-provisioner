# Compatibilidade de hardware

## NVIDIA

- Verifique GPU em https://developer.nvidia.com/cuda-gpus
- Secure Boot pode bloquear driver — desative ou assine módulo

## WSL2

- Windows 11 recomendado
- Instale drivers NVIDIA para WSL no Windows host
- `wsl --update`

## Sem GPU

Defina `install_nvidia: false`. CUDA e nvidia-container-toolkit serão ignorados.

## Dual-boot

Não execute playbook com drivers NVIDIA se estiver bootado em ambiente sem GPU dedicada.

## VMs

Passthrough de GPU necessário para CUDA dentro de VM.
