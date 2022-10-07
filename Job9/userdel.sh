#!/bin/bash

my_csv=Shell_Userlist.csv

while IFS="," read Id Prenom Nom Mdp Role;

	do
		sudo userdel -f $Prenom

	done < $my_csv
