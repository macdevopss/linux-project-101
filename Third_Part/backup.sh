#!/bin/bash

# Check if we are root privilage or not


#!/bin/bash

# 🔐 Root kontrolü
if [[ "${UID}" -ne 0 ]]; then
  echo "Bu script root olarak çalıştırılmalı." >&2
  exit 1
fi

# 📁 Yedeklenecek dizinler
SOURCE_DIRS="/home/ec2-user/data /etc /boot /usr"

# 🎯 Yedek hedef klasörü
DEST_DIR="/mnt/backup"

# 💾 Kayıt ismi (hostname + tarih)
DATE=$(date +%F_%H-%M)
HOST=$(hostname)
FILENAME="${HOST}_${DATE}.tgz"

# 📝 Yedek başlat
echo "[$(date)] Yedekleme başlıyor..."

# 📦 Arşiv oluştur
tar -czf "${DEST_DIR}/${FILENAME}" ${SOURCE_DIRS} 2>/dev/null

# 🔍 Kontrol
if [[ $? -eq 0 ]]; then
  echo "[$(date)] Yedekleme başarılı: ${FILENAME}"
else
  echo "[$(date)] Yedekleme sırasında hata oluştu." >&2
  exit 1
fi

# 📚 Sonuçları listele
ls -lh "${DEST_DIR}" | grep "${HOST}"
