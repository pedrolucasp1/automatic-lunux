#!/bin/bash
# -*- coding: utf-8 -*-

#            ___  ____  ____   __  ____  ____  ____    ____  _  _
#           / __)(  _ \(  __) / _\(_  _)(  __)(    \  (  _ \( \/ )
#          ( (__  )   / ) _) /    \ )(   ) _)  ) D (   ) _ ( )  /
#           \___)(__\_)(____)\_/\_/(__) (____)(____/  (____/(__/
#
#
#           ____  ____  ____  ____   __     __    _  _   ___   __   ____
#          (  _ \(  __)(    \(  _ \ /  \   (  )  / )( \ / __) / _\ / ___)
#           ) __/ ) _)  ) D ( )   /(  O )  / (_/\) \/ (( (__ /    \\___ \
#          (__)  (____)(____/(__\_) \__/   \____/\____/ \___)\_/\_/(____/

# O Script será automaticamente finalizado se encontrar erros
clear
set -euo pipefail
IFS=$'\n\t'

# Redefinir cores
Color_Off='\033[0m'       # Redefinir texto

# Cores regulares
Red='\033[01;31m'           # Red          /     # Vermelho
RedFlash='\033[05;31m'      # RedFlash     /     # Vermelho piscando
Green='\033[01;32m'         # Green        /     # Verde
GreenFlash='\033[05;32m'    # GreenFlash   /     # Verde piscando
Yellow='\033[01;33m'        # Yellow       /     # Amarelo
YellowFlash='\033[05;33m'   # YellowFlash  /     # Amarelo piscando
Purple='\033[01;35m'        # Purple       /     # Roxo
PurpleFlash='\033[05;35m'   # PurpleFlash  /     # Roxo piscando
Cyan='\033[01;36m'          # Cyan         /     # Ciano
CyanFlash='\033[0;36m'      # CyanFlash    /     # Ciano piscando
Blue='\033[01;34m'          # Blue         /     # Azul
BlueFlash='\033[05;34m'     # BlueFlash    /     # Azul piscando
Black='\033[01;30m'         # Black        /     # Preto
BlackFlash='\033[05;30m'    # BlackFlash   /     # Preto piscando
White='\033[01;37m'         # White        /     # Branco
WhiteFlash='\033[05;37m'    # WhiteFlash   /     # Branco piscando

# Veriicar a conexão com a internet
clear
echo -e "$Blue #################################################################################### $Color_Off"
echo
echo -e "$Blue [ INTERNET ] $Color_Off $Yellow Testando o acesso a internet $Color_Off $YellowFlash ... $Color_Off"
    if ! ping -c 7 www.google.com > /dev/null ; then
        echo
        echo -e "$Red [ FALHA ] $Color_Off $White Falha na conectividade, verifique o erro, e tente novamente. $Color_Off"
        echo -e "$Green \n Saindo... $Color_Off"
        exit
    else
        echo
        echo -e "$Red [ SUCESSO ] $Color_Off $White Conectividade OK. $Color_Off"
        echo
    fi
echo
echo -e "$Blue #################################################################################### $Color_Off"
clear

# Exibir menu com opções
while true; do
    echo -e "$White \n ==========================================================
        Digite o número da opção desejada:
        1 - Instalar configurações básicas
        2 - ***
        3 - ***
        4 - ***
        0 - Sair
 =========================================================== $Color_Off"
    echo -n -e "$BlueFlash \n ->OPÇÃO:  $Color_Off"
    read option

# Verificar se foi digitado alguma opção
if [ -z $option ]; then
    echo -e "$RedFlash \n ERRO: digite uma opcao $Color_Off"
    exit
fi

case $option in
    1)
        clear
        # Modificar o arquivo "/etc/apt/sources.list"
        echo -e "$Blue  [ ATUALIZANDO ] $Color_Off $WhiteFlash  Atualizando a sources.list .. $Color_Off"
        sed -i "1,20d" /etc/apt/sources.list
        echo "####################################################################################" >> /etc/apt/sources.list
        echo "#                               Repositórios Oficiais                              #" >> /etc/apt/sources.list
        echo "####################################################################################" >> /etc/apt/sources.list
        echo " " >> /etc/apt/sources.list
        echo " " >> /etc/apt/sources.list
        echo "# deb cdrom:[Debian GNU/Linux 11.3.0 _Bullseye_ - Unofficial amd64 NETINST with firmware 20220326-11:22]/ bullseye contrib main non-free" >> /etc/apt/sources.list
        echo " " >> /etc/apt/sources.list
        echo "#deb cdrom:[Debian GNU/Linux 11.3.0 _Bullseye_ - Unofficial amd64 NETINST with firmware 20220326-11:22]/ bullseye contrib main non-free" >> /etc/apt/sources.list
        echo " " >> /etc/apt/sources.list
        echo "deb http://deb.debian.org/debian/ bullseye main non-free contrib" >> /etc/apt/sources.list
        echo "deb-src http://deb.debian.org/debian/ bullseye main non-free contrib" >> /etc/apt/sources.list
        echo " " >> /etc/apt/sources.list
        echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list
        echo "deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list
        echo " " >> /etc/apt/sources.list
        echo "# bullseye-updates, to get updates before a point release is made;" >> /etc/apt/sources.list
        echo "# see https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_updates_and_backports" >> /etc/apt/sources.list
        echo "deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list
        echo "deb-src http://deb.debian.org/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list
        echo " " >> /etc/apt/sources.list
        echo "# deb http://ftp.debian.org/debian stretch-backports main contrib non-free" >> /etc/apt/sources.list
        echo "# deb-src http://ftp.debian.org/debian stretch-backports main contrib non-free" >> /etc/apt/sources.list
        echo " " >> /etc/apt/sources.list
        echo "####################################################################################" >> /etc/apt/sources.list
        clear
        
        # Atualizar os pacotes e o sistema de atualização
        echo -e "$Blue  [ ATUALIZANDO ] $Color_Off $WhiteFlash  Atualizando os pacotes e atualizando a distribuição .. $Color_Off"
        apt-get update -y && apt-get upgrade -y 1> /dev/null 2> /dev/stdout
        clear
        
        # Instalar pré-requisitos
        echo -e "$Blue  [ INSTALANDO ] $Color_Off $WhiteFlash  Instalando os pré-requisitos .. $Color_Off"
        apt install openssh-server iptables wget firmware-linux firmware-linux-free firmware-linux-nonfree vim bash-completion fzf grc nftables ufw fail2ban -y 1> /dev/null 2> /dev/stdout
        . /etc/os-release
        echo "deb http://deb.debian.org/debian ${VERSION_CODENAME}-backports main" > /etc/apt/sources.list.d/backports.list
        apt-get update -y && apt-get upgrade -y 1> /dev/null 2> /dev/stdout
        clear
        
        # Atualizar as configurações do bash
        echo -e "$Blue  [ ATUALIZANDO ] $Color_Off $WhiteFlash  Atualizando o layout do bash .. $Color_Off"
        echo '' >> /etc/bash.bashrc
        echo '# Autocompletar extra' >> /etc/bash.bashrc
        echo 'if ! shopt -oq posix; then' >> /etc/bash.bashrc
        echo '  if [ -f /usr/share/bash-completion/bash_completion ]; then' >> /etc/bash.bashrc
        echo '    . /usr/share/bash-completion/bash_completion' >> /etc/bash.bashrc
        echo '  elif [ -f /etc/bash_completion ]; then' >> /etc/bash.bashrc
        echo '    . /etc/bash_completion' >> /etc/bash.bashrc
        echo '  fi' >> /etc/bash.bashrc
        echo 'fi' >> /etc/bash.bashrc
        sed -i 's/"syntax on/syntax on/' /etc/vim/vimrc
        sed -i 's/"set background=dark/set background=dark/' /etc/vim/vimrc
        sed -i "1,20d" /root/.vimrc
        echo "set showmatch" >> /root/.vimrc
        echo "set ts=4" >> /root/.vimrc
        echo "set sts=4" >> /root/.vimrc
        echo "set sw=4" >> /root/.vimrc
        echo "set autoindent" >> /root/.vimrc
        echo "set smartindent" >> /root/.vimrc
        echo "set smarttab" >> /root/.vimrc
        echo "set expandtab" >> /root/.vimrc
        echo '"set number' >> /root/.vimrc
        sed -i "s/# export LS_OPTIONS='--color=auto'/export LS_OPTIONS='--color=auto'/" /root/.bashrc
        sed -i 's/# eval "`dircolors`"/eval "`dircolors`"/' /root/.bashrc
        sed -i 's/# eval "$(dircolors)"/eval "$(dircolors)"/' /root/.bashrc
        sed -i "s/# alias ls='ls \$LS_OPTIONS'/alias ls='ls \$LS_OPTIONS'/" /root/.bashrc
        sed -i "s/# alias ll='ls \$LS_OPTIONS -l'/alias ll='ls \$LS_OPTIONS -l'/" /root/.bashrc
        sed -i "s/# alias l='ls \$LS_OPTIONS -lA'/alias l='ls \$LS_OPTIONS -lha'/" /root/.bashrc
        echo 'source /usr/share/doc/fzf/examples/key-bindings.bash' >> ~/.bashrc
        echo "alias grep='grep --color'" >> /root/.bashrc
        echo "alias egrep='egrep --color'" >> /root/.bashrc
        echo "alias ip='ip -c'" >> /root/.bashrc
        echo "alias diff='diff --color'" >> /root/.bashrc
        echo "alias tail='grc tail'" >> /root/.bashrc
        echo "alias ping='grc ping'" >> /root/.bashrc
        echo "alias ps='grc ps'" >> /root/.bashrc
        echo "PS1='\${debian_chroot:+(\$debian_chroot)}\[\033[01;31m\]\u\[\033[01;34m\]@\[\033[01;33m\]\h\[\033[01;34m\][\[\033[00m\]\[\033[01;37m\]\w\[\033[01;34m\]]\[\033[01;31m\]\\$\[\033[00m\] '" >> /root/.bashrc
        clear
        
        # Atualizar configurações ssh
        echo -e "$Blue  [ ATUALIZANDO ] $Color_Off $WhiteFlash  Atualizando as configurações do ssh .. $Color_Off"
        sed -i 's/#Port 22/Port 54222/g' /etc/ssh/sshd_config
        sed -i 's/#LoginGraceTime 2m/LoginGraceTime 10/g' /etc/ssh/sshd_config
        sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin prohibit-password/g' /etc/ssh/sshd_config
        sed -i '/#ListenAddress ::/aAllowUsers globotech' /etc/ssh/sshd_config
        sed -i '/AllowUsers globotech/a ' /etc/ssh/sshd_config
        /etc/init.d/ssh restart
        clear
        
        # Atualizar configurações de segurança
        echo -e "$Blue  [ ATUALIZANDO ] $Color_Off $WhiteFlash  Atualizando as configurações de segurança .. $Color_Off"
        systemctl enable nftables
        sed -i "1,20d" /etc/apt/sources.list
        echo "#!/usr/sbin/nft -f" >> /etc/apt/sources.list
        echo " " >> /etc/apt/sources.list
        echo "flush ruleset" >> /etc/apt/sources.list
        echo " " >> /etc/apt/sources.list
        echo "table inet filter {" >> /etc/apt/sources.list
        echo "        chain input {" >> /etc/apt/sources.list
        echo "                type filter hook input priority 0;" >> /etc/apt/sources.list
        echo "                ip saddr 177.53.196.22 tcp dport 54222 counter accept;" >> /etc/apt/sources.list
        echo "                ip saddr 177.53.196.218 tcp dport 54222 counter accept;" >> /etc/apt/sources.list
        echo "                tcp dport 54222 counter drop;" >> /etc/apt/sources.list
        echo "                tcp dport 22 counter drop;" >> /etc/apt/sources.list
        echo "        }" >> /etc/apt/sources.list
        echo "        chain forward {" >> /etc/apt/sources.list
        echo "                type filter hook forward priority 0;" >> /etc/apt/sources.list
        echo "        }" >> /etc/apt/sources.list
        echo "        chain output {" >> /etc/apt/sources.list
        echo "                type filter hook output priority 0;" >> /etc/apt/sources.list
        echo "        }" >> /etc/apt/sources.list
        echo "}" >> /etc/apt/sources.list
        systemctl restart nftables
        echo " " >> /etc/hosts.allow
        echo "sshd: 177.53.196.22" >> /etc/hosts.allow
        echo "sshd: 177.53.196.218" >> /etc/hosts.allow
        echo " " >> /etc/hosts.deny
        echo "sshd: ALL" >> /etc/hosts.deny
        sed -i '/port    = ssh/aport    = ssh,54222' /etc/fail2ban/jail.conf
        echo "maxretry = 2" >> /etc/fail2ban/jail.d/defaults-debian.conf
        echo "bantime  = 12h" >> /etc/fail2ban/jail.d/defaults-debian.conf
        iptables -A INPUT -s 177.53.196.22 -p tcp --dport 54222 -j ACCEPT
        iptables -A INPUT -s 177.53.196.218 -p tcp --dport 54222 -j ACCEPT
        iptables -A INPUT -p tcp --dport 54222 -j DROP
        ufw default deny incoming
        ufw allow 54222
        iptables -A INPUT -p tcp --dport 22 -j DROP
        ufw enable
        clear
        read;;

    0)
        echo -e "$Green \n Saindo... $Color_Off"
        exit;;

    *)
        echo
        echo -e "$Red \n ERRO... $Color_Off"
        echo ;;
esac
done
