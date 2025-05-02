#!/bin/bash

# SSH log dosyasındaki geçersiz kullanıcı denemelerini analiz et
grep "Invalid user" auth.logs | awk '{print $8}' | sort | uniq -c | sort -nr | while read COUNT USER
do
  echo "$USER  :  $COUNT kez denemiş"
done
