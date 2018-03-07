#!/bin/sh
#----------------------------------------------------
# This script helps you to block ads on your SmartTv
# Created by lekron @ SamyGO Forums
#----------------------------------------------------
# Version:4.0
# Date:01/16/2018
#----------------------------------------------------
# Credit goes to Github user BenBaltz who
# created the original hosts files!
#----------------------------------------------------
# If you have any questions or found a bug
# please contact me on SamyGO forums
#----------------------------------------------------
divider="-------------------------------------------------------------------"

appendActiveProfile(){
echo "" >> /mtd_rwarea/hosts
echo "#Active_profile:$AP" >> /mtd_rwarea/hosts
}

createInit(){
echo $divider
echo -n "Creating init.d script.. "
echo "#!/bin/sh
#
# Startup script to block ad servers
# Created by lekron @ SamyGO Forums
# 
. /dtv/SGO.env


stop_bootloop()
{
	for USB in /dtv/usb/sd* ; do
		echo \"checking \$USB\"
		[ -e \$USB/STOP ] && echo \"STOP found. Script exit...\" && exit 1
	done
}


case \$1 in 
	start)
	stop_bootloop
	/bin/mount -o bind /mtd_rwarea/hosts /etc/hosts
	sleep 1
	;;
	stop)
	/bin/umount /etc/hosts
	;;
	status)
	;;
	*)
	echo \"Usage: \$0 {start|stop|status}\" 1>&2
	exit 0
	;;
esac
" > /mnt/etc/init.d/02_05_adblock.init
sleep 1
echo "Done!"
echo -n "Setting right permissions.. "
chmod 755 /mnt/etc/init.d/02_05_adblock.init
sleep 0.2
echo "Done!"
}

createInitAlert(){
echo $divider
echo -n "Creating init.d script.. "
echo "#!/bin/sh
#
# Startup script to block ad servers
# Created by lekron @ SamyGO Forums
# 
. /dtv/SGO.env

SODIR=\$SYSROOT/opt/privateer/usr/libso
TEXT=\"$TEXT1\"

stop_bootloop()
{
	for USB in /dtv/usb/sd* ; do
		echo \"checking \$USB\"
		[ -e \$USB/STOP ] && echo \"STOP found. Script exit...\" && exit 1
	done
}


case \$1 in 
	start)
	stop_bootloop
	/bin/mount -o bind /mtd_rwarea/hosts /etc/hosts
	sleep 1
	samyGOso -A -B -l \$SODIR/libAlert.so \"TEXT:\$TEXT\"
	;;
	stop)
	/bin/umount /etc/hosts
	;;
	status)
	;;
	*)
	echo \"Usage: \$0 {start|stop|status}\" 1>&2
	exit 0
	;;
esac
" > /mnt/etc/init.d/02_05_adblock.init
sleep 1
echo "Done!"
echo -n "Setting right permissions.. "
chmod 755 /mnt/etc/init.d/02_05_adblock.init
sleep 0.2
echo "Done!"
}

createInitText(){
echo $divider
echo -n "Creating init.d script.. "
echo "#!/bin/sh
#
# Startup script to block ad servers
# Created by lekron @ SamyGO Forums
# 
. /dtv/SGO.env

SODIR=\$SYSROOT/opt/privateer/usr/libso

stop_bootloop()
{
	for USB in /dtv/usb/sd* ; do
		echo \"checking \$USB\"
		[ -e \$USB/STOP ] && echo \"STOP found. Script exit...\" && exit 1
	done
}


case \$1 in 
	start)
	stop_bootloop
	/bin/mount -o bind /mtd_rwarea/hosts /etc/hosts
	sleep 1
	samyGOso -d -A -B -l /mtd_rwcommon/libText.so TEXT:'$TEXT2' FONT:2 CENTER:2 COLOR:0x07f74f TIMEOUT:4
	;;
	stop)
	/bin/umount /etc/hosts
	;;
	status)
	;;
	*)
	echo \"Usage: \$0 {start|stop|status}\" 1>&2
	exit 0
	;;
esac
" > /mnt/etc/init.d/02_05_adblock.init
sleep 1
echo "Done!"
echo -n "Setting right permissions.. "
chmod 755 /mnt/etc/init.d/02_05_adblock.init
sleep 0.2
echo "Done!"
}

createInitTextC(){
echo $divider
echo -n "Creating init.d script.. "
echo "#!/bin/sh
#
# Startup script to block ad servers
# Created by lekron @ SamyGO Forums
# 
. /dtv/SGO.env

SODIR=\$SYSROOT/opt/privateer/usr/libso

stop_bootloop()
{
	for USB in /dtv/usb/sd* ; do
		echo \"checking \$USB\"
		[ -e \$USB/STOP ] && echo \"STOP found. Script exit...\" && exit 1
	done
}


case \$1 in 
	start)
	stop_bootloop
	/bin/mount -o bind /mtd_rwarea/hosts /etc/hosts
	sleep 1
	samyGOso -d -A -B -l /mtd_rwcommon/libText.so TEXT:'$TEXT2' $OWNARGS
	;;
	stop)
	/bin/umount /etc/hosts
	;;
	status)
	;;
	*)
	echo \"Usage: \$0 {start|stop|status}\" 1>&2
	exit 0
	;;
esac
" > /mnt/etc/init.d/02_05_adblock.init
sleep 1
echo "Done!"
echo -n "Setting right permissions.. "
chmod 755 /mnt/etc/init.d/02_05_adblock.init
sleep 0.2
echo "Done!"
}

blockUpdate(){
if [ $only_updserver == '1' ]; then
echo "# This file blocks Samsungs update servers
127.0.0.1 localhost
0.0.0.0 samsungads.com
0.0.0.0 ads.samsungads.com
0.0.0.0 config.samsungads.com
0.0.0.0 www.samsungotn.net
0.0.0.0 samsungotn.net
0.0.0.0 msecnd.net
0.0.0.0 samsungacr.com
0.0.0.0 log-ingestion-eu.samsungacr.com
0.0.0.0 apps-pub.samsungcloudcdn.com
0.0.0.0 otn.samsungcloudcdn.com
0.0.0.0 otnprd8.samsungcloudsolution.net
0.0.0.0 otnprd9.samsungcloudsolution.net
0.0.0.0 otnprd10.samsungcloudsolution.net
0.0.0.0 otnprd11.samsungcloudsolution.net
0.0.0.0 configprd.samsungcloudsolution.net
0.0.0.0 vision.samsungtvads.com
0.0.0.0 osbstg-apps.samsungqbe.com" > /mtd_rwarea/hosts
else
echo "# Samsung Update Servers
0.0.0.0 samsungads.com
0.0.0.0 ads.samsungads.com
0.0.0.0 config.samsungads.com
0.0.0.0 www.samsungotn.net
0.0.0.0 samsungotn.net
0.0.0.0 msecnd.net
0.0.0.0 samsungacr.com
0.0.0.0 log-ingestion-eu.samsungacr.com
0.0.0.0 apps-pub.samsungcloudcdn.com
0.0.0.0 otn.samsungcloudcdn.com
0.0.0.0 otnprd8.samsungcloudsolution.net
0.0.0.0 otnprd9.samsungcloudsolution.net
0.0.0.0 otnprd10.samsungcloudsolution.net
0.0.0.0 otnprd11.samsungcloudsolution.net
0.0.0.0 configprd.samsungcloudsolution.net
0.0.0.0 vision.samsungtvads.com
0.0.0.0 osbstg-apps.samsungqbe.com" >> /mtd_rwarea/hosts
fi
}

lAlert(){
alert_style=2
clear
echo $divider
echo -n "Which message do you want to be shown? " && read TEXT1
echo $divider
}

lText(){
clear
echo $divider
echo "Do you want to customize the settings for libText? (y/n)"
echo "Otherwise default config is used:"
echo "Center Bottom, Green Text, 4 secs timeout"
echo "(Only advanced users should choose \"y\")"
echo -n "Choice: " && read advanced
echo $divider

case $advanced in
	y|Y)
		alert_style=4
		clear
		echo $divider
		echo -n "Which message do you want to be shown? " && read TEXT2
		echo $divider
		clear
		echo "Now type your own arguments below"
		echo "e.g. \"FONT:2 CENTER:2 COLOR:0x07f74f TIMEOUT:4\""
		echo -n "Arguments: " && read OWNARGS
		echo $divider
		;;
	*)
		alert_style=3
		clear
		echo $divider
		echo -n "Which message do you want to be shown? " && read TEXT2
		echo $divider
		;;
esac
}

downloadSamyGO(){
if [ ! -e /mnt/opt/privateer/usr/bin/samyGOso ]; then
		echo -n "Downloading samyGOso extension.. "
		curl -kso /tmp/samyGOso.gz "https://raw.githubusercontent.com/lekron42/smart.adblock/master/samyGOso.gz"
		echo "Done!"
		echo $divider
		echo -n "Moving samyGOso to /mnt/opt/privateer/usr/bin/.. "
		gzip -df /tmp/samyGOso.gz
		mv -f /tmp/samyGOso /mnt/opt/privateer/usr/bin/samyGOso
		echo "Done!"
		echo $divider
		echo -n "Setting permissions.. "
		chmod 777 /mnt/opt/privateer/usr/bin/samyGOso
		sleep 0.2
		echo "Done!"
		echo $divider
fi
}

downAlert(){
clear
echo $divider
if [ ! -e /mnt/opt/privateer/usr/libso/libAlert.so ]; then
	downloadSamyGO					#DEBUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUG
	echo -n "Downloading libAlert.. "
	curl -kso /tmp/libAlert.so.gz "https://raw.githubusercontent.com/lekron42/smart.adblock/master/libAlert.so.gz"
	echo "Done!"
	echo $divider
	echo -n "Moving libAlert.so to /mnt/opt/privateer/usr/libso/.. "
	gzip -df /tmp/libAlert.so.gz
	mv -f /tmp/libAlert.so /mnt/opt/privateer/usr/libso/libAlert.so
	echo "Done!"
	echo $divider
	echo -n "Setting right permissions.. "
	chmod 755 /mnt/opt/privateer/usr/libso/libAlert.so
	sleep 0.2
	echo "Done!"
	echo $divider
	echo "Do you want to test if libAlert is correctly installed? (y/n)"
	echo -n "Choice: " && read test
	case $test in
		y|Y)echo $divider; echo "You should now see a popup on TV.."; sleep 0.5; samyGOso -d -A -B -l /mnt/opt/privateer/usr/libso/libAlert.so TEXT:"It works!" &> /dev/null; sleep 2;;
		*);;
	esac
else
	echo "libAlert already installed!"
	echo $divider
	sleep 1.5
	extras
fi
}

downText(){
clear
echo $divider
if [ ! -e /mtd_rwcommon/libText.so ] || [ ! -e /mtd_rwcommon/font1.raw ] || [ ! -e /mtd_rwcommon/font2.raw ] || [ ! -e /mtd_rwcommon/font3.raw ] || [ ! -e /mtd_rwcommon/font4.raw ]; then
	downloadSamyGO							#DEBUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUG
	echo -n "Downloading libText.. "
	curl -kso /tmp/libText.tar.gz "https://raw.githubusercontent.com/lekron42/smart.adblock/master/libText.tar.gz"
	echo "Done!"
	echo $divider
	echo -n "Moving files to /mtd_rwcommon/.. "
	cd /tmp/
	tar -mzxf /tmp/libText.tar.gz libText/libText.so
	tar -mzxf /tmp/libText.tar.gz libText/font1.raw
	tar -mzxf /tmp/libText.tar.gz libText/font2.raw
	tar -mzxf /tmp/libText.tar.gz libText/font3.raw
	tar -mzxf /tmp/libText.tar.gz libText/font4.raw
	mv -f /tmp/libText/font1.raw /mtd_rwcommon/font1.raw
	mv -f /tmp/libText/font2.raw /mtd_rwcommon/font2.raw
	mv -f /tmp/libText/font3.raw /mtd_rwcommon/font3.raw
	mv -f /tmp/libText/font4.raw /mtd_rwcommon/font4.raw
	mv -f /tmp/libText/libText.so /mtd_rwcommon/libText.so
	rm -rf /tmp/libText/
	echo "Done!"
	echo $divider
	echo -n "Setting right permissions.. "
	chmod 755 /mtd_rwcommon/libText.so
	sleep 0.2
	echo "Done!"
	echo $divider
	echo "Do you want to test if libText is correctly installed? (y/n)"
	echo -n "Choice: " && read test
	case $test in
		y|Y)echo $divider; echo "You should now see a popup on TV.."; sleep 0.5; samyGOso -d -A -B -l /mtd_rwcommon/libText.so TEXT:'It works!' FONT:2 CENTER:2 COLOR:0x07f74f TIMEOUT:5 &> /dev/null; sleep 2;;
		*);;
	esac
	else
	echo "libText already installed!"
	echo $divider
	sleep 1.5
	extras
fi
}

delAlert(){
clear
echo $divider
if [ ! -e /mnt/opt/privateer/usr/libso/libAlert.so ]; then
	echo "libAlert not installed!"
	echo $divider
	sleep 1.5
	extras
else
	echo -n "Deleting libAlert.. "
	rm -f /mnt/opt/privateer/usr/libso/libAlert.so
	echo "Done!"
	echo $divider
	sleep 1.5
	extras
fi
}

delText(){
clear
echo $divider
if [ ! -e /mtd_rwcommon/libText.so ]; then
	echo "libText not installed!"
	echo $divider
	sleep 1.5
	extras
else
	echo -n "Deleting libText.. "
	rm -f /mtd_rwcommon/libText.so
	rm -f /mtd_rwcommon/font*.raw
	echo "Done!"
	echo $divider
	sleep 1.5
	extras
fi
}

isActive(){
hosts_size=$(wc -c </etc/hosts)
if [ $hosts_size -gt 500 ]; then
	#echo "Already mounted hosts file detected!"
	echo -n "Unmounting current /etc/hosts.. "
	/bin/umount /etc/hosts
	sleep 0.1
	echo "Done!"
	echo $divider
fi
}

checkUpdate(){
clear
echo "=================================="
echo "Checking for Update, please wait.."
echo "=================================="
filepath="$(dirname $(readlink -f $0))/$(basename $0)"
#version=$(cat $filepath | grep "[V]ersion:" | cut -d: -f 2)
version=$(grep "[V]ersion:" $filepath | cut -d: -f 2)
mainv=$(echo $version | cut -d. -f 1)
subv=$(echo $version | cut -d. -f 2)
curl -kso /tmp/current_version "https://raw.githubusercontent.com/lekron42/smart.adblock/master/current_version"
if [ -e /tmp/current_version ]; then
	currentMain=$(cat /tmp/current_version | cut -d. -f 1)
	currentSub=$(cat /tmp/current_version | cut -d. -f 2)
	rm /tmp/current_version
fi
if ( [ $mainv -eq $currentMain ] && [ $subv -lt $currentSub ] ) || [ $mainv -lt $currentMain ]; then
	echo "There is a new version avalailable ($mainv.$subv -> $currentMain.$currentSub)! Download now? (y/n)"
	echo -n "Choice: " && read yn
	case $yn in
		y|Y)
			curl -kso /tmp/new_version "https://raw.githubusercontent.com/lekron42/smart.adblock/master/adblock.sh"
			mv /tmp/new_version $filepath		#DEBUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUG
			echo "Update was successful! Please re-run the script.."
			exit 0
			;;
		*)
			;;
	esac
	called_from_extras = 0	#DEBUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUG
else
	if [ $called_from_extras -eq 1 ]; then
		called_from_extras = 0
		echo "You already have the newest version installed!"
		sleep 1
	fi
fi
}

extras(){
clear
echo $divider
echo "-                    SmartAdblock 4.0 | lekron                    -"
echo $divider
echo "-                              Extras                             -"
echo $divider
echo "1) Check for updates"
echo $divider
echo "2) Blacklist hosts"
echo $divider
echo "3) Download & install libAlert"
echo "4) Download & install libText"
echo $divider
echo "5) Delete libAlert"
echo "6) Delete libText"
echo $divider
echo "7) Main menu"
echo "8) Exit"
echo $divider
echo -n "Choice: " && read choice 

case $choice in
1) called_from_extras=1; checkUpdate; extras;;
2) blacklist; extras;;
3) downAlert; extras;;
4) downText; extras;;
5) delAlert;;
6) delText;;
7) main_menu;;
8) clear; exit;;
*) clear; echo $divider; echo "Invalid option. Please choose another number."; echo $divider; sleep 1.5; extras;;
esac
}

main_menu(){
alert_style=0
only_updserver=0

active_profile=$(grep "[A]ctive_profile" /mtd_rwarea/hosts | cut -d: -f 2)

clear
echo $divider
echo "-                    SmartAdblock 4.0 | lekron                    -"
echo $divider
echo "-       Master = Main list | [G]ambling | [P]orn | [S]ocial       -"
echo $divider
echo -n " 1) Master"; if [ $active_profile -eq 1 ]; then echo " [ACTIVE]"; else echo ""; fi
echo -n " 2) Master + G"; if [ $active_profile -eq 2 ]; then echo " [ACTIVE]"; else echo ""; fi
echo -n " 3) Master + P"; if [ $active_profile -eq 3 ]; then echo " [ACTIVE]"; else echo ""; fi
echo -n " 4) Master + S"; if [ $active_profile -eq 4 ]; then echo " [ACTIVE]"; else echo ""; fi
echo -n " 5) Master + G + P"; if [ $active_profile -eq 5 ]; then echo " [ACTIVE]"; else echo ""; fi
echo -n " 6) Master + G + S"; if [ $active_profile -eq 6 ]; then echo " [ACTIVE]"; else echo ""; fi
echo -n " 7) Master + P + S"; if [ $active_profile -eq 7 ]; then echo " [ACTIVE]"; else echo ""; fi
echo -n " 8) Master + G + P + S"; if [ $active_profile -eq 8 ]; then echo " [ACTIVE]"; else echo ""; fi
echo $divider
echo -n " 9) Lightweight"; if [ $active_profile -eq 9 ]; then echo " [ACTIVE]"; else echo ""; fi
echo $divider
echo -n "10) Only Block Samsungs Update Servers"; if [ $active_profile -eq 10 ]; then echo " [ACTIVE]"; else echo ""; fi
echo $divider
echo "11) Extras"
echo $divider
echo "12) Disable Adblock"
echo $divider
echo -n "13) Exit"
testvar=$(grep -c "/etc/hosts" /proc/mounts)
if [ $testvar -gt 0 ]; then
	#echo "                                          [Hosts: Mounted!]"
	echo "											[Hosts: Mounted!]"
else
	#echo "                                        [Hosts: Unmounted!]"
	echo "										  [Hosts: Unmounted!]"
fi
echo $divider
echo -n "Your choice: " && read num
echo $divider
case $num in
	1) CH="master"; AP=1; process;;
	2) CH="g"; AP=2; process;;
	3) CH="p"; AP=3; process;;
	4) CH="s"; AP=4; process;;
	5) CH="gp"; AP=5; process;;
	6) CH="gs"; AP=6; process;;
	7) CH="ps"; AP=7; process;;
	8) CH="gps"; AP=8; process;;
	9) lightweight=1; AP=9; process;;
	10) only_updserver=1; AP=10; process;;
	11) extras;;
	12) deactivate;;
	13) clear; exit 0;;
	*) clear; echo $divider; echo "Invalid option. Please choose another number."; echo $divider; sleep 2;;
esac
}

deactivate(){
clear
if [ -e /mnt/etc/init.d/02_05_adblock.init ]; then
	echo $divider
	echo -n "Deleting init.d script.. "
	rm -f /mnt/etc/init.d/02_05_adblock.init
	sleep 0.1
	echo "Done!"
fi
isActive
if [ -e /mtd_rwarea/hosts ]; then
	echo $divider
	echo -n "Deleting /mtd_rwarea/hosts.. "
	rm -f /mtd_rwarea/hosts
	sleep 0.1
	echo "Done!"
fi
if [ -e /mtd_rwarea/adblock_profile ]; then
	rm -f /mtd_rwarea/adblock_profile
fi
echo $divider
echo "Adblocking disabled!"
echo $divider
sleep 1
echo "1) Main Menu"
echo "2) Exit"
echo -n "Choice: " && read choice
case $choice in
	2) exit 0;;
	*) main_menu;;
esac
}

blacklist(){
	clear
	if [ ! -e /mtd_rwarea/hosts ]; then
		echo $divider
		echo "You don't have adblocking activated. Please choose one of the other options and try again!"
		echo $divider
		sleep 2
	else
		FIRSTBL=$(grep -c "# Own blocked hosts" /mtd_rwarea/hosts)
		echo $divider
		echo "Which host do you want to block? E.g google.com"
		echo -n "Host: " && read BLACKL
		echo $divider
		isActive						#DEBUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUG
		echo -n "Adding host to /mtd_rwarea/hosts.. "
		if [ $FIRSTBL -eq 1 ]; then
			echo "0.0.0.0 $BLACKL" >> /mtd_rwarea/hosts
		else
			echo "# Own blocked hosts" >> /mtd_rwarea/hosts
			echo "0.0.0.0 $BLACKL" >> /mtd_rwarea/hosts
		fi
		echo "Done!"
		echo $divider
		echo -n "Mounting new hosts file to /etc/hosts.. "
		sleep 0.4
		/bin/mount -o bind /mtd_rwarea/hosts /etc/hosts
		echo "Done!"
		sleep 1
		echo $divider
		echo "1) Add another entry"
		echo "2) Main Menu"
		echo "3) Exit"
		echo -n "Choice: " && read choice
		case $choice in
			1) blacklist;;
			3) clear; exit 0;;
			*) main_menu;;
		esac
	fi
}

process(){
overwrite="y"
if [ -e /mnt/etc/init.d/02_05_adblock.init ]; then
	clear
	echo $divider
	echo "Init.d script already active! Do you want to overwrite it? (y/n)"
	echo -n "Choice: " && read overwrite
	echo $divider
fi
case $overwrite in
	y|Y)
	if [ -e /mnt/opt/privateer/usr/libso/libAlert.so ] && [ ! -e /mtd_rwcommon/libText.so ]; then
		clear
		echo $divider
		echo "It seems you have libAlert installed."
		echo "Do you want to use an alert message on TV startup? (y/n)"
		echo -n "Choice: " && read alert
		echo $divider
		case $alert in
			y|Y) lAlert;;
			*) alert_style=1;;
		esac
		echo $divider
	elif [ ! -e /mnt/opt/privateer/usr/libso/libAlert.so ] && [ -e /mtd_rwcommon/libText.so ]; then
		clear
		echo $divider
		echo "It seems you have libText installed."
		echo "Do you want to use an alert message on TV startup? (y/n)"
		echo -n "Choice: " && read alert
		echo $divider
		case $alert in
			y|Y) lText;;
			*) alert_style=1;;
		esac
		echo $divider
	elif [ -e /mnt/opt/privateer/usr/libso/libAlert.so ] && [ -e /mtd_rwcommon/libText.so ]; then	
		clear
		echo $divider
		echo "It seems you have libAlert and libText installed."
		echo "Which one do you want to use to get an alert message on TV startup?"
		echo "1) libAlert"
		echo "2) libText"
		echo "3) None"
		echo -n "Choice: " && read alert
		echo $divider
		case $alert in
			1) lAlert;;
			2) lText;;
			*) alert_style=1; clear; echo $divider; echo "Not using an alert message on TV startup!"; echo $divider; sleep 1.5;;
		esac
	else
		clear
		echo $divider
		echo "You have neither libAlert nor libText installed.."
		echo "With one of these libs installed you are able to activate an on-screen"
		echo "popup on tv startup indicating that the adblocker has been activated."
		echo "Do you want to download & install one of the libs?"
		echo "1) libAlert"
		echo "2) libText (recommended)"
		echo "3) none"
		echo -n "Choice: " && read alert
		case $alert in
			1) downAlert; lAlert;;
			2) downText; lText;;
			*);;
		esac
	fi
	;;
	*)
	clear
	echo $divider
	echo "Init.d script not overwriteritten!"
	echo $divider
	sleep 0.3
	;;
esac
clear
echo $divider
if [ $only_updserver == '0' ]; then
	echo -n "Downloading hosts file. This can take a while. Please wait.. "
	if [ $lightweight == '1' ]; then
		curl -kso /tmp/hosts "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
	else
		curl -kso /tmp/hosts "https://raw.githubusercontent.com/lekron42/smart.adblock/master/hosts-$CH.txt"
	fi
	echo "Done!"
	echo $divider
	isActive
	sleep 0.2
	echo -n "Moving downloaded hosts to /mtd_rwarea/hosts.. "
	mv -f /tmp/hosts /mtd_rwarea/hosts
	sleep 0.8
	echo "Done!"
	echo $divider
	sleep 0.3
else
	isActive
	sleep 0.2
	echo -n "Writing server list to /mtd_rwarea/hosts.. "
	blockUpdate
	appendActiveProfile
	echo "Done!"
	echo $divider
	sleep 1
fi
echo -n "Setting right permissions.. "
chmod 777 /mtd_rwarea/hosts
sleep 0.2
echo "Done!"
if [ $only_updserver == '0' ]; then
	echo $divider
	echo -n "Adding Samsung update servers.. "
	blockUpdate
	appendActiveProfile
	echo "Done!"
fi
case $alert_style in
	1) createInit;;
	2) createInitAlert;;
	3) createInitText;;
	4) createInitTextC;;
esac
echo $divider
echo -n "Mounting new hosts file to /etc/hosts.. "
sleep 0.3
/bin/mount -o bind /mtd_rwarea/hosts /etc/hosts
echo "Done!"
echo $AP > /mtd_rwarea/adblock_profile
chmod 644 /mtd_rwarea/adblock_profile
echo $divider
echo "Hosts file activated!"
echo $divider
sleep 0.2
echo "1) Main Menu"
echo "2) Exit"
echo -n "Choice: " && read choice
case $choice in
	2) clear; exit 0;;
	*) main_menu;;
esac
}

clear
called_from_extras = 0
checkUpdate
while true; do
	main_menu
done
