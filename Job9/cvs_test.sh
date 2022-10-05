#!/bin/bash

my_input=Shell_Userlist.csv

while IFS="," read Id Prenom Nom Mdp Role;
do 
    groupadd FTP
    mkdir /home/FTP
    chgrp FTP FTP
    chmod 770 FTP

    if [ "$Id" -eq "$Id" ] 2>/dev/null;
        then
        sudo useradd -u $Id -p $Mdp $Prenom 

        addgroup $Prenom FTP
        mkdir /home/$Prenom/FTP

        echo /home/FTP /home/$Prenom/FTP auto bind,defaults 0 0 > cat >> /etc/fstab
        mount -a

        if [ ${Role:0:5} = "Admin" ];
            then
            sudo usermod -aG sudo $Prenom
                  
        fi

    fi

done < $my_input