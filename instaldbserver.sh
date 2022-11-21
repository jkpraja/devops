#!/bin/bash

echo "==============================================="
echo " \033[0;31mIni adalah script untuk menginstal db server\033[0m "
echo "==============================================="
status=$(dpkg-query -W --showformat='${db:Status-Status}' mysql-server)
if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
	sudo apt install mysql-server
else
	echo "MySQL sudah terinstal"
fi
echo "enable db server untuk aktif after boot"
if sudo systemctl status mysql | grep "disabled"; then
	echo "DB Server is \033[1;31mdisabled\033[0m"
	sudo systemctl enable mysql
else
	echo "DB Server is \033[1;32menabled\033[0m"
fi
echo "cek status server database"
if sudo systemctl status mysql | grep "inactive"; then
	echo "DB Server is \033[1,31minactive\033[0m"
	sudo systemctl start mysql
else
	echo "DB Server is \033[1;32mactive\033[0m"
fi
