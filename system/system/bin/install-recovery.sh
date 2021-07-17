#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:6831d793c53772926d1849e4b7ae6ad0bf0637c4 > /cache/recovery/last_install_recovery_status; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:33554432:ad2e5bb09a0848b90092407e171923bb6b32ba53 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:6831d793c53772926d1849e4b7ae6ad0bf0637c4 >> /cache/recovery/last_install_recovery_status && \
      echo "Installing new recovery image: succeeded" >> /cache/recovery/last_install_recovery_status || \
      echo "Installing new recovery image: failed" >> /cache/recovery/last_install_recovery_status
else
  echo "Recovery image already installed" >> /cache/recovery/last_install_recovery_status
fi
