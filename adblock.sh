#!/bin/sh
#----------------------------------------------------
# This script helps you to block ads on your SmartTv
# Created by lekron @ SamyGO Forums
#----------------------------------------------------
# Version:5.0
# Date:08/14/2019
#----------------------------------------------------
# If you have any questions or found a bug
# please contact me on SamyGO forums
#----------------------------------------------------
divider="-------------------------------------------------------------------"
header="-                 SmartAdblock 5.0 final | lekron                 -"

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
#Pack: E5UPD-P
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
echo "Do you want to customize the settings for libText? (y/N)"
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

downSamyGO(){
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
	downSamyGO
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
	echo "Do you want to test if libAlert is correctly installed? (Y/n)"
	echo -n "Choice: " && read test
	case $test in
		n|N);;
		*)echo $divider; echo "You should now see a popup on TV.."; sleep 0.5; samyGOso -d -A -B -l /mnt/opt/privateer/usr/libso/libAlert.so TEXT:"It works!" &> /dev/null; sleep 2;;
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
	downSamyGO
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
	echo "Do you want to test if libText is correctly installed? (Y/n)"
	echo -n "Choice: " && read test
	case $test in
		n|N);;
		*)echo $divider; echo "You should now see a popup on TV.."; sleep 0.5; samyGOso -d -A -B -l /mtd_rwcommon/libText.so TEXT:'It works!' FONT:2 CENTER:2 COLOR:0x07f74f TIMEOUT:5 &> /dev/null; sleep 2;;
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
if [ -e /mnt/opt/privateer/usr/libso/libAlert.so ]; then
	echo -n "Deleting libAlert.. "
	rm -f /mnt/opt/privateer/usr/libso/libAlert.so
	echo "Done!"
	echo $divider
	sleep 1.5
	extras
else
	echo "libAlert not installed!"
	echo $divider
	sleep 1.5
	extras
fi
}

delText(){
clear
echo $divider
if [ -e /mtd_rwcommon/libText.so ]; then
	echo -n "Deleting libText.. "
	rm -f /mtd_rwcommon/libText.so
	rm -f /mtd_rwcommon/font*.raw
	echo "Done!"
	echo $divider
	sleep 1.5
	extras
else
	echo "libText not installed!"
	echo $divider
	sleep 1.5
	extras
fi
}

isActive(){
hosts_size=$(wc -c </etc/hosts)
if [ $hosts_size -gt 500 ]; then
	echo -n "Unmounting current /etc/hosts.. "
	/bin/umount /etc/hosts
	sleep 0.1
	echo "Done!"
	echo $divider
fi
}

check_update(){
clear
echo "=================================="
echo "Checking for update, please wait.."
echo "=================================="
filepath="$(dirname $(readlink -f $0))/$(basename $0)"
version=$(grep "[V]ersion:" $filepath | cut -d: -f 2)
mainv=$(echo $version | cut -d. -f 1)
subv=$(echo $version | cut -d. -f 2)
curl -kso /tmp/current_version "https://raw.githubusercontent.com/lekron42/smart.adblock/master/current_version"

if [ -e /tmp/current_version ]; then
	not_found=$(grep -c "404" /tmp/current_version)
	if [ ! $not_found -gt 0 ]; then
		currentMain=$(cat /tmp/current_version | cut -d. -f 1)
		currentSub=$(cat /tmp/current_version | cut -d. -f 2)
	else
		currentMain=0
		currentSub=0
	fi
	rm /tmp/current_version
else
	currentMain=0
	currentSub=0
fi

curl -kso /tmp/ab_chnglg "https://raw.githubusercontent.com/lekron42/smart.adblock/master/changelog.txt"
if [ -e /tmp/ab_chnglg ]; then
	not_found=$(grep -c "404" /tmp/ab_chnglg)
	if [ ! $not_found -gt 0 ]; then
		changelog=$(cat /tmp/ab_chnglg )
	else
		changelog="There was an error retrieving changelog.."
	fi
	rm /tmp/ab_chnglg
else
	changelog="There was an error retrieving changelog.."
fi

clear

if ( [ $mainv -eq $currentMain ] && [ $subv -lt $currentSub ] ) || [ $mainv -lt $currentMain ]; then
	echo "There is a new version avalailable! ($mainv.$subv -> $currentMain.$currentSub)"
	echo "----------------- Changelog ------------------"
	echo "$changelog"
	echo "----------------------------------------------"
	echo "Download now? (Y/n)"
	echo -n "Choice: " && read yn
	case $yn in
		n|N)
			;;
		*)
			curl -kso /tmp/new_version "https://raw.githubusercontent.com/lekron42/smart.adblock/master/adblock.sh"
			mv /tmp/new_version $filepath
			echo "Update was successful! Please re-run the script.."
			exit 0
			;;
	esac
	called_from_extras=0
elif [ $currentMain -eq 0 ] && [ $currentSub -eq 0 ]; then
	echo "There was an error looking for the current version!"
	echo "Do you want to try again? (Y/n)"
	echo -n "Choice: " && read retry
	case $retry in
		n|N);;
		*) check_update;;
	esac
else
	if [ $called_from_extras -eq 1 ]; then
		called_from_extras=0
		echo "You already have the newest version installed!"
		sleep 1
	fi
fi
}

check_pack(){
if grep -q "E5P4RK-P" /etc/hosts; then
	active_filter=1
elif grep -q "E8LUG0-P" /etc/hosts; then
	active_filter=2
elif grep -q "E8LU-P" /etc/hosts; then
	active_filter=3
elif grep -q "E5UPD-P" /etc/hosts; then
	active_filter=4
else
	active_filter=0
fi
}

extras(){
clear
echo $divider
echo "$header"
echo $divider
echo "-                              Extras                             -"
echo $divider
echo "1) Check for updates"
echo $divider
echo "2) Download & install libAlert"
echo "3) Download & install libText"
echo $divider
echo "4) Delete libAlert"
echo "5) Delete libText"
echo $divider
echo "6) Main menu"
echo "7) Exit"
echo $divider
echo -n "Choice: " && read choice

case $choice in
1) called_from_extras=1; check_update; extras;;
2) downAlert; extras;;
3) downText; extras;;
4) delAlert;;
5) delText;;
6) main_menu;;
7) clear; exit;;
*) clear; echo $divider; echo "Invalid option. Please choose another number."; echo $divider; sleep 1.5; extras;;
esac
}

main_menu(){
alert_style=0
only_updserver=0

check_pack

clear
echo $divider
echo "$header"
echo $divider
echo -n "1) Spark (Size: ~1.3M)"; if [ $active_filter -eq 1 ]; then echo " [ACTIVE]"; else echo ""; fi
echo -n "2) BluGo (Size: ~3.6M)"; if [ $active_filter -eq 2 ]; then echo " [ACTIVE]"; else echo ""; fi
echo -n "3) Blu   (Size: ~6.7M)"; if [ $active_filter -eq 3 ]; then echo " [ACTIVE]"; else echo ""; fi
echo -n "4) Only block Samsung update servers (included in 1-3)"; if [ $active_filter -eq 4 ]; then echo " [ACTIVE]"; else echo ""; fi
echo $divider
echo "5) Extras"
echo $divider
echo "6) Disable Adblock"
echo $divider
echo -n "7) Exit"
testvar=$(grep -c "/etc/hosts" /proc/mounts)
if [ $testvar -gt 0 ]; then
	echo "                                          [Hosts: Mounted!]"
else
	echo "                                        [Hosts: Unmounted!]"
fi
echo $divider
echo -n "Your choice: " && read num
echo $divider
case $num in
	1) filter="spark"; filter_id=1; process;;
	2) filter="bluGo"; filter_id=2; process;;
	3) filter="blu"; filter_id=3; process;;
	4) only_updserver=1; filter_id=4; process;;
	5) extras;;
	6) deactivate;;
	7) clear; exit 0;;
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

process(){
overwrite="y"
if [ -e /mnt/etc/init.d/02_05_adblock.init ]; then
	clear
	echo $divider
	echo "Do you want to change your startup preferences? (y/N)"
	echo -n "Choice: " && read overwrite
	echo $divider
fi
case $overwrite in
	y|Y)
	if [ -e /mnt/opt/privateer/usr/bin/libso/libAlert.so ] && [ ! -e /mtd_rwcommon/libText.so ]; then
		clear
		echo $divider
		echo "It seems you have libAlert installed."
		echo "To prevent freezes of the tv it is advised to not use the tv"
		echo "until adblocking is enabled.."
		echo "Do you want to see a message on startup? (y/N)"
		echo -n "Choice: " && read alert
		echo $divider
		case $alert in
			y|Y) lAlert;;
			*) alert_style=1;;
		esac
		echo $divider
	elif [ ! -e /mnt/opt/privateer/usr/bin/libso/libAlert.so ] && [ -e /mtd_rwcommon/libText.so ]; then
		clear
		echo $divider
		echo "It seems you have libText installed."
		echo "To prevent freezes of the tv it is advised to not use the tv"
		echo "until adblocking is enabled.."
		echo "Do you want to see a message on startup? (y/N)"
		echo -n "Choice: " && read alert
		echo $divider
		case $alert in
			y|Y) lText;;
			*) alert_style=1
		esac
		echo $divider
	elif [ -e /mnt/opt/privateer/usr/bin/libso/libAlert.so ] && [ -e /mtd_rwcommon/libText.so ]; then
		clear
		echo $divider
		echo "It seems you have libAlert and libText installed."
		echo "To prevent freezes of the tv it is advised to not use the tv"
		echo "until adblocking is enabled.."
		echo "Which one do you want to use for an alert message on TV startup?"
		echo "1) libAlert"
		echo "2) libText (recommended)"
		echo "3) none"
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
		echo "To prevent freezes of the tv it is advised to not use the tv until"
		echo "adblocking is enabled.."
		echo "Do you want to download and install one of these libs?"
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
	echo "Init.d script not overwritten!"
	echo $divider
	sleep 0.3
	;;
esac
clear
echo $divider
if [ $only_updserver == '0' ];then
	echo "Downloading hosts file. This can take a while. Please wait.. "
	echo $divider
	curl -#ko /tmp/hosts "https://raw.githubusercontent.com/EnergizedProtection/block/master/$filter/formats/hosts"
	echo $divider
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
called_from_extras=0
check_update
check_pack
while true; do
	main_menu
done
