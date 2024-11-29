# S8050-genoa-coreboot-helper

1. This is source code setup repository for MiTAC S8050 of Genoa/OpenSIL/coreboot.
2. Supported platform: S8050GM4NE-2T (https://www.mitaccomputing.com/Motherboards_S8050_S8050GM4NE-2T_EN~Spec)


## Clone Repositories

1. Execute init.sh to clone source codes and apply patches
2. The repositories and folder structure will be:
  - coreboot (Tag: 24.08)
  - Patches


## Build and Deploy

1. cd coreboot
2. Execute "make crossgcc-x64 -j 4 CPUS=4" to compile related utilities
3. Execute "make defconfig KBUILD_DEFCONFIG=configs/config.mitac_s8050" 
4. Execute "make" to build coreboot
5. Deploy build/coreboot.rom to 32MB SPI flash of S8050


## Progress

- With these repositories, S8050 + Genoa can boot to OS(Ubuntu) successfully
- Support USB and NVME devices
- Debug messages are available through BMC SOL


## Existing Known Issues or Limitation
- VGA in OS is not fully functioning
- eSPI configurations in device tree are disabled
