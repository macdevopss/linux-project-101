#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.


# Get the username (login).


# Get the real name (contents for the description field).

#!/bin/bash

# Check for root privilege
if [[ "${UID}" -ne 0 ]]; then
  echo "Lütfen bu scripti root olarak çalıştırın." >&2
  exit 1
fi

# Kullanıcı adı ve açıklama kontrolü
if [[ "${#}" -lt 2 ]]; then
  echo "Kullanım: ${0} <kullanıcı_adı> <açıklama>" >&2
  exit 1
fi

# Değişkenleri al
USERNAME="${1}"
shift
COMMENT="${*}"

# Şifre üret (16 karakter)
PASSWORD=$(openssl rand -base64 16)

# Kullanıcıyı oluştur
useradd -c "${COMMENT}" -m "${USERNAME}"
if [[ "${?}" -ne 0 ]]; then
  echo "Kullanıcı oluşturulamadı." >&2
  exit 1
fi

# Şifreyi ata
echo "${USERNAME}:${PASSWORD}" | chpasswd
if [[ "${?}" -ne 0 ]]; then
  echo "Şifre atanamadı." >&2
  exit 1
fi

# İlk girişte şifre değişimi zorunlu yap
passwd -e "${USERNAME}"

# Bilgi çıktısı
echo
echo "Kullanıcı başarıyla oluşturuldu:"
echo "Username : ${USERNAME}"
echo "Password : ${PASSWORD}"
echo "Host     : ${HOSTNAME}"


# Get the password.


# Create the account.



# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.



# Set the password.


# Check to see if the passwd command succeeded.



# Force password change on first login.


# Display the username, password, and the host where the user was created.
