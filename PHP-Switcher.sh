#!/bin/bash
# Cons Colors
ORANGE='\033[0;33m'
PURPLE='\033[0;35m'
LBLUE='\033[1;34m'
LGREEN='\033[1;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
BOLD=`tput bold`

# Display menu
function show_menu {
	printf "${ORANGE}${BOLD}Your current version of PHP is${NC}\n"
	echo "******************************"
	php -v
	echo "******************************"
	printf "${BOLD}${LBLUE}Please type the number of the next options${NC}\n"
}

# Display options
function show_options {
	echo "1) PHP-5"
	echo "2) PHP-7"
	echo "3) Quit"
}

printf "${ORANGE}+--------------------------+${NC}\n"
printf "${ORANGE}|${NC}   PHP Version Selector   ${ORANGE}|${NC}\n"
printf "${ORANGE}|${NC}    By Jose Pablo Arce    ${ORANGE}|${NC}\n"
printf "${ORANGE}|${NC}     ${PURPLE}GitHub:${NC} ${BOLD}Pablo251     ${ORANGE}|${NC}\n"
printf "${ORANGE}+--------------------------+${NC}\n\n"
printf "${BOLD}-> If you want to install PHP 5 and PHP 7 together, please have a look to this http://askubuntu.com/a/762161 \n\n"

#call show_menu function
show_menu
OPTIONS="PHP-5 PHP-7 Quit"
select opt in $OPTIONS; do
   if [ "$opt" = "Quit" ]; then
     echo done
     exit
   elif [ "$opt" = "PHP-5" ]; then
     printf "${YELLOW}${BOLD}Setting PHP 5...${NC}\n"
	#Execute Comands
sudo a2dismod php7.0 ; sudo a2enmod php5.6 ; sudo service apache2 restart #Step 1 to PHP 5
sudo update-alternatives --set php /usr/bin/php5.6  #Step 2 to set PHP 5
     #clear shell
     clear
     printf "\n${LGREEN}${BOLD}Done.. ¡PHP 5 was set! :)${NC}\n\n"
     show_menu #Calling to the show_menu function
     show_options #Calling to the show_option function
   elif [ "$opt" = "PHP-7" ]; then
     printf "${YELLOW}${BOLD}Setting PHP 7...${NC}\n"
	#Execute Comands
sudo a2dismod php5.6 ; sudo a2enmod php7.0 ; sudo service apache2 restart #Step 1 to PHP 7
sudo update-alternatives --set php /usr/bin/php7.0  #Step 2 to set PHP 7
     #clear shell
     clear
     printf "\n${LGREEN}${BOLD}Done.. ¡PHP 7 was set! :)${NC}\n\n"
     show_menu #Calling to the show_menu function
     show_options #Calling to the show_option function
   else
     clear
     printf "\n${RED}${BOLD}¡Invalid option!${NC}\n\n"
     show_menu #Calling to the show_menu function
     show_options #Calling to the show_option function
   fi
done
