#!/bin/bash

# Tüm terminate olayları içinde Paul tarafından yapılan varsa onları filtrele

cat event_history.csv | \
grep 'TerminateInstances' | \
grep -i 'paul' | \
grep -o 'i-[a-zA-Z0-9]\{17\}' | \
sort | uniq > result.txt

echo "Eğer Paul tarafından terminate edilen instance varsa result.txt dosyasına yazıldı."
