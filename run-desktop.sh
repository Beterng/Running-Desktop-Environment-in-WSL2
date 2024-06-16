#!/bin/bash

ENV = "xfce4 xfce4-goodies"
EXPDESKTOP = "Xephyr"

# prinT and get Input from user.
while true
do
	echo "1. Set Desktop INFO "
	echo "    ( Default environment: xfce4 xfce4-goodies; Default Desktop environment: Xephyr " 
	echo "2. Install for new desktop "
	echo "3. Setup environment for BACK_END "
	echo "4. Start your season "
	echo "5. Exit"

    read Input

	while true
	do
		if [ $Input - lt "1" || $Input - gt "5"];
		then 
			echo "Please type a correct option. " 
			read Input		
		fi
		# IS corect?
		if  [$Input = "1" | $Input = " 2" | $Input = "3" | $Input = "4" | $Input = "5" ];
		then
			break
		fi
	done
 break
done


exec echo "export XDG_SESSION_TYPE=x11" >> ~/.profile
exec echo "export GDK_PLATFORM=x11" >> ~/.profile
exec echo "export GDK_BACKEND=x11" >> ~/.profile
exec echo "export QT_QPA_PLATFORM=xcb" >> ~/.profile
exec echo "export WAYLAND_DISPLAY=" >> ~/.profile
exec echo "export XDG_RUNTIME_DIR=/run/user/$(id -u)" >> ~/.profile

exec source ~/.profile

exec Xephyr -br -ac -noreset -resizeable -screen 1600x900 :1
exec dbus-launch --exit-with-session startxfce4