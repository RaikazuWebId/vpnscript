#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);

IZIN=$(curl -sS https://raw.githubusercontent.com/RaikazuWebId/izinsc/main/ip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo "IZIN DI TERIMA!!"
else
clear
figlet "Akses di tolak!! Silakan Hubungi Admin" | lolcat
exit 0
fi

RAI="\033[1;91m"
KAZU="\033[1;37m"

function L1() {
  echo -e "${UK}┌──────────────────────────────────────────┐ ${Suffix} "
}
function L2() {
  echo -e "${UK}└──────────────────────────────────────────┘ ${Suffix}"
}

fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m="
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}


#install
cp /media/cybervpn/var.txt /tmp
cp /root/cybervpn/var.txt /tmp
rm -rf cybervpn
apt update && apt upgrade -y
apt install python3 python3-pip -y
apt install sqlite3 -y
cd /media/
rm -rf cybervpn
rm var.txt
rm database.db
rm _init_.py
rm _main_.py
rm modules
wget https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/cybervpn.zip
unzip cybervpn.zip
cd cybervpn
pip3 install -r requirements.txt
pip install pillow
pip install speedtest-cli
pip3 install aiohttp
pip3 install paramiko
#isi data
azi=$(cat /root/nsdomain)
domain=$(cat /etc/xray/domain)
clear
echo "INSTALL BOT CREATE SSH via TELEGRAM"
read -e -p "[*] Input Your Id Telegram :" admin
read -e -p "[*] Input Your bot Telegram :" token
read -e -p "[*] Input username Telegram :" user

cat > /media/cybervpn/var.txt << END
ADMIN="$admin"
BOT_TOKEN="$token"
DOMAIN="$domain"
DNS="$azi"
PUB="7fbd1f8aa0abfe15a7903e837f78aba39cf61d36f183bd604daa2fe4ef3b7b59"
OWN="$user"
SALDO="1.000.000"
END


clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "API KEY TOKEN : $token"
echo "ID            : $admin"
echo "DOMAIN        : $domain"
echo -e "==============================="
echo "Setting done"


rm -f /usr/bin/nenen

echo -e '#!/bin/bash\ncd /media/\npython3 -m cybervpn' > /usr/bin/nenen


chmod 777 /usr/bin/nenen

cat > /etc/systemd/system/cybervpn.service << END
[Unit]
Description=Simple CyberVPN - @CyberVPN
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/nenen
Restart=always

[Install]
WantedBy=multi-user.target

END
systemctl daemon-reload
systemctl start cybervpn
systemctl enable cybervpn

clear
echo "Download Assets"

res1() {
wget -q -O /usr/bin/panelbot "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/panelbot.sh" && chmod +x /usr/bin/panelbot
}


res2() {
wget -q -O /usr/bin/addnoobz "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/addnoobz.sh" && chmod +x /usr/bin/addnoobz
}

res3() {
wget -q -O /media/log-install.txt "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/log-install.txt"
}

res4() {
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/add-vless.sh" && chmod +x /usr/bin/add-vless
}

res5() {
wget -q -O /usr/bin/addtr "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/addtr.sh" && chmod +x /usr/bin/addtr
}

res6() {
wget -q -O /usr/bin/addws "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/addws.sh" && chmod +x /usr/bin/addws
}

res7() {
wget -q -O /usr/bin/addss "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/addss.sh" && chmod +x /usr/bin/addss
}

res8() {
wget -q -O /usr/bin/cek-ssh "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/cek-ssh.sh" && chmod +x /usr/bin/cek-ssh
}

res9() {
wget -q -O /usr/bin/cek-ss "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/cek-ss.sh" && chmod +x /usr/bin/cek-ss
}

res10() {
wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/cek-tr.sh" && chmod +x /usr/bin/cek-tr
}

res11() {
wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/cek-vless.sh" && chmod +x /usr/bin/cek-vless
}

res12() {
wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/cek-ws.sh" && chmod +x /usr/bin/cek-ws
}

res13() {
wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/del-vless.sh" && chmod +x /usr/bin/del-vless
}


res14() {
wget -q -O /usr/bin/cek-noobz "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/cek-noobz.sh" && chmod +x /usr/bin/cek-noobz
}


res15() {
wget -q -O /usr/bin/deltr "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/deltr.sh" && chmod +x /usr/bin/deltr
}

res16() {
wget -q -O /usr/bin/delws "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/delws.sh" && chmod +x /usr/bin/delws
}

res17() {
wget -q -O /usr/bin/delss "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/delss.sh" && chmod +x /usr/bin/delss
}

res18() {
wget -q -O /usr/bin/renew-ss "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/renew-ss.sh" && chmod +x /usr/bin/renew-ss
}

res19() {
wget -q -O /usr/bin/renewtr "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/renewtr.sh" && chmod +x /usr/bin/renewtr
}

res20() {
wget -q -O /usr/bin/renewvless "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/renewvless.sh" && chmod +x /usr/bin/renewvless
}

res21() {
wget -q -O /usr/bin/renewws "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/renewws.sh" && chmod +x /usr/bin/renewws
}

res22() {
wget -q -O /usr/bin/cek-mws "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/cek-mws.sh" && chmod +x /usr/bin/cek-mws
}

res23() {
wget -q -O /usr/bin/cek-mvs "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/cek-mvs.sh" && chmod +x /usr/bin/cek-mvs
}

res24() {
wget -q -O /usr/bin/cek-mss "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/cek-mss.sh" && chmod +x /usr/bin/cek-mss
}

res25() {
wget -q -O /usr/bin/cek-mts "https://raw.githubusercontent.com/RaikazuWebId/vpnscript/mytich/bot/cek-mts.sh" && chmod +x /usr/bin/cek-mts
}
L1
echo -e "${RAI}               RAIKAZU PROJECT BOT ${KAZU}"
L2
echo -e ""
echo -e "${RAI} DOWNLOADING. ${KAZU}"
fun_bar 'res1'
echo -e "${RAI} DOWNLOADING.. ${KAZU}"
fun_bar 'res2'
echo -e "${RAI} DOWNLOADING... ${KAZU}"
fun_bar 'res3'
echo -e "${RAI} DOWNLOADING.... ${KAZU}"
fun_bar 'res4'
echo -e "${RAI} DOWNLOADING. ${KAZU}"
fun_bar 'res5'
echo -e "${RAI} DOWNLOADING.. ${KAZU}"
fun_bar 'res6'
echo -e "${RAI} DOWNLOADING... ${KAZU}"
fun_bar 'res7'
echo -e "${RAI} DOWNLOADING.... ${KAZU}"
fun_bar 'res8'
echo -e "${RAI} DOWNLOADING. ${KAZU}"
fun_bar 'res9'
echo -e "${RAI} DOWNLOADING.. ${KAZU}"
fun_bar 'res10'
echo -e "${RAI} DOWNLOADING... ${KAZU}"
fun_bar 'res11'
echo -e "${RAI} DOWNLOADING.... ${KAZU}"
fun_bar 'res12'
echo -e "${RAI} DOWNLOADING. ${KAZU}"
fun_bar 'res13'
echo -e "${RAI} DOWNLOADING.. ${KAZU}"
fun_bar 'res14'
echo -e "${RAI} DOWNLOADING... ${KAZU}"
fun_bar 'res15'
echo -e "${RAI} DOWNLOADING.... ${KAZU}"
fun_bar 'res16'
echo -e "${RAI} DOWNLOADING. ${KAZU}"
fun_bar 'res17'
echo -e "${RAI} DOWNLOADING.. ${KAZU}"
fun_bar 'res18'
echo -e "${RAI} DOWNLOADING... ${KAZU}"
fun_bar 'res19'
echo -e "${RAI} DOWNLOADING.... ${KAZU}"
fun_bar 'res20'
echo -e "${RAI} DOWNLOADING. ${KAZU}"
fun_bar 'res21'
echo -e "${RAI} DOWNLOADING.. ${KAZU}"
fun_bar 'res22'
echo -e "${RAI} DOWNLOADING... ${KAZU}"
fun_bar 'res23'
echo -e "${RAI} DOWNLOADING.... ${KAZU}"
fun_bar 'res24'
echo -e "${RAI} DOWNLOADING. ${KAZU}"
fun_bar 'res25'
L1
echo "DOWNLOADING ASSETS, DONE MASEH"
L2
cp /tmp/var.txt /media/cybervpn

echo " Installations Complete, Type /Menu On Your Bot "

rm /media/cybervpn.zip