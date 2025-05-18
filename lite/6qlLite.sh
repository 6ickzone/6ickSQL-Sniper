#!/bin/bash
# 6ickSQL Sniper v6 LITE EDITION
# Aman untuk publik — versi Lite (tanpa inject quote)
# by 0x6ick

clear
figlet "6ickSQL Sniper" | lolcat
echo "LITE v6 - Google Dork Hunter (Safe Version)"
echo "by 0x6ick"
echo "==================================="
echo ""

read -p "[+] Masukkan Dork Google: " dork
read -p "[+] Berapa halaman (10 URL per halaman, ex: 5): " page

> hasil.txt
> suspect.txt

for ((i=0;i<$page;i++))
do
   let "start=i*10"
   echo "[!] Scraping page $((i+1)) ..."

   curl -s -A "Mozilla/5.0" "https://www.google.com/search?q=${dork}&start=${start}" \
   | grep -oP '/url\?q=\K(https?://[^&]+)' | sed 's/%25/%/g' >> hasil.txt

done

echo "[+] Total URL yang dikumpulkan: $(wc -l < hasil.txt)"
echo "[!] Mulai cek status target..."
echo ""

while read target; do
   status=$(curl -s -o /dev/null -w "%{http_code}" "$target")

   if [[ "$status" == "200" ]]; then
       echo "[LIVE] $target"
   elif [[ "$status" == "500" ]]; then
       echo "[SUSPECT] $target (500 error)" | tee -a suspect.txt
   else
       echo "[SKIP] $target ($status)"
   fi

done < hasil.txt

echo ""
echo "[✓] Done! Cek hasil di hasil.txt & suspect.txt"
echo "[!] Versi Lite hanya cek status, tanpa inject."
echo "==================================="