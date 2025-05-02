#!/bin/bash

# Tek satırlı PEM dosyasını oku
LINE=$(cat certificate.pem)

# Başlık ve son satırı ayır
BEGIN="-----BEGIN RSA PRIVATE KEY-----"
END="-----END RSA PRIVATE KEY-----"
BODY=$(echo $LINE | sed -e "s/${BEGIN}//" -e "s/${END}//")

# 64 karakterde bir satır olacak şekilde parçala
FORMATTED=$(echo "$BODY" | fold -w64)

# Yeni PEM dosyasına yaz
{
  echo "$BEGIN"
  echo "$FORMATTED"
  echo "$END"
} > new.pem

echo "new.pem dosyası başarıyla oluşturuldu."
