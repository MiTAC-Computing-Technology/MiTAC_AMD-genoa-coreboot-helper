WORK_DIR=$PWD

COREBOOT_DIR=coreboot
LINUX_PAYLOAD_DIR=payloads/external/LinuxBoot

REPO_URL="https://github.com/coreboot/coreboot"
AMD_BLOBS_URL="https://github.com/coreboot/amd_blobs"
COREBOOT_TAG=24.08
COREBOOT_CFG=configs/config.mitac_s8050

echo "=== Setup Start ==="
#
# Clone Source Code
#
echo "Clone coreboot"
git clone $REPO_URL --recurse-submodules
cd $WORK_DIR/$COREBOOT_DIR
git checkout $COREBOOT_TAG

echo "Clone amd blobs"
cd $WORK_DIR/$COREBOOT_DIR/3rdparty
git clone $AMD_BLOBS_URL

#
# Apply Patches
#
echo "Patch coreboot"
cd $WORK_DIR/$COREBOOT_DIR
git am $WORK_DIR/Patches/$COREBOOT_DIR/*.patch --whitespace=fix

echo "Copy prebuild Linux Payload"
cd $LINUX_PAYLOAD_DIR
mkdir build
cp $WORK_DIR/Patches/Image build/

echo "=== Setup Finished ==="