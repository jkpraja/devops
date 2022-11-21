#!/bin/bash

echo "=============================================="
echo " \033[1;93mIni adalah script untuk menginstal webserver\033[0m "
echo "=============================================="
echo "\033[1;33mStep 1:\033[0m Install apache2"
status=$(dpkg-query -W --showformat='${db:Status-Status}' apache2)
if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
	sudo apt install apache2
else
echo "Apache2 sudah \033[1;95mterinstal\033[0m"
fi
echo "\033[1;93mStep 2:\033[0m Install php"
statusphp=$(dpkg-query -W --showformat='${db:Status-Status}' php)
if [ ! $? = 0 ] || [ ! "$statusphp" = installed ]; then
	sudo apt install php
else
echo "PHP sudah \033[1;95mterinstal\033[0m"
fi
statusphp2=$(dpkg-query -W --showformat='${db:Status-Status}' php-mysql)
if [ ! $? = 0 ] || [ ! "$statusphp2" = installed ]; then
	sudo apt install php-mysql
else
echo "PHP MYSQL sudah \033[1;95mterinstal\033[0m"
fi
if [ ! "$statusphp" = installed ] & [ ! "$statusphp2" = installed ]; then
echo "\033[1;35mInstalasi telah selesai dilakukan\033[0m"
fi
echo "=============================================="
echo "\033[1;33mStep 3:\033[0m Pengaktifan Webserver"

#sudo systemctl enable apache2
echo "\033[1;33mStep 4:\033[0m Cek status webserver"
if sudo systemctl status apache2 | grep "inactive"; then
	echo "Webserver Apache2 is \033[1;31minactive\033[0m"
	sudo systemctl start apache2
else
	echo "Webserver Apache2 is \033[1;32mactive\033[0m"
fi
echo "\033[1;33mStep 5:\033[0m Enable webserver untuk aktif after boot"
if sudo systemctl status apache2 | grep "disabled"; then
	echo "Webserver Apache2 is \033[1;31mdisabled\033[0m"
	sudo systemctl  enable apache2
else
	echo "Webserver Apache2 is \033[1;32menabled\033[0m"
fi
