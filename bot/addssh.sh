#!/bin/bash

# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'

# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
export ungu='\033[0;35m'
# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
# ==========================================
# // Get Bot
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
CHATIDD=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 4)
TIMES="15"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear

# Valid Script
clear
export TIME="10"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
WAKTU=$(date | cut -d " " -f 2-10000)
clear
# Getting
domain=$(cat /etc/xray/domain)
sldomain=$(cat /root/nsdomain)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /etc/slowdns/server.pub)
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m              ⇱ CREATE UDP ACCOUNT                 \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (Days): " masaaktif

IP=$(wget -qO- ipinfo.io/ip);
ws="$(cat ~/log-install.txt | grep -w "Websocket TLS" | cut -d: -f2|sed 's/ //g')"
ws2="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m              ⇱ INFORMASI SSH UDP                  \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e "Domain  :$domain"
echo -e "Username: $Login"
echo -e "Password: $Pass"
echo -e "Created : $hariini"
echo -e "Expired : $expi"
echo -e "port UDP: 1-65535"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${ungu}                      SSH UDP BY RAIKAZU TUNNELING"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
#Auto Notif Transaksi Jangan Di Ubah
function notif_addhost() {
CHATIDD="$CHATIDD"
KEY="$KEY"
TIMES="$TIMES"
URL="$URL"
TEXTT="
<code>◇━━━━━━━━━━━━━━━━◇</code>
<b>⚡TRANSAKSI SUCCESS⚡</b>
<code>◇━━━━━━━━━━━━━━━━◇</code>
<b>DATE   :</b> <code>$WAKTU</code>
<b>DETAIL :</b> <code>TRX SSH</code>
<b>ISP    :</b> <code>$ISP $CITY</code>
<b>DURASI :</b> <code>$masaaktif HARI</code>
<code>◇━━━━━━━━━━━━━━━━◇</code>
<i>AutoNotif Create Akun From Server..</i> 
"'&reply_markup={"inline_keyboard":[[{"text":"RAIKAZU🛍️","url":"https://t.me/RAIKAZUSTORE"},{"text":"WHATSHAPP🚀","url":"wa.me/+6282164649858"}]]}'
curl -s --max-time $TIMES -d "chat_id=$CHATIDD&disable_web_page_preview=1&text=$TEXTT&parse_mode=html" $URL >/dev/null
}
notif_addhost