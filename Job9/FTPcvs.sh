#!/bin/bash

my_input=Shell_Userlist.csv
groupadd ftpgroup
sudo cp proftpd.conf /etc/proftpd/proftpd.conf

while IFS="," read Id Prenom Nom Mdp Role;
do 
      if [ "$Id" -eq "$Id" ] 2>/dev/null;
            then
            Mdp=${Mdp:0:6}
            sudo useradd -u $Id -p $Mdp $Prenom  
            sudo usermod -aG ftpgroup $Prenom    

            if [ ${Role:0:5} = "Admin" ];
                  then
                  sudo usermod -aG sudo $Prenom
                  
            fi

      fi

done < $my_input
