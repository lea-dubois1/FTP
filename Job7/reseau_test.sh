#!/bin/bash

# installer proftpd avec tout ses modules, openssl et filezilla
sudo apt install proftpd-*
sudo apt install openssl
sudo apt install filezilla

# Creer le dossier SSL et y generer la clef et le certificat
sudo mkdir /etc/proftpd/ssl
sudo openssl req -x509 -newkey rsa:2048 -keyout /etc/proftpd/ssl/proftpd.key.pem -out /etc/proftpd/ssl/proftpd.cert.pem -nodes -days 365


# modifier les fichier de conf : proftpd.conf ; tls.conf et modules.conf
sudo cp modules.conf /etc/proftpd/modules.conf
sudo cp proftpd.conf /etc/proftpd/proftpd.conf
sudo cp tls.conf /etc/proftpd/tls.conf

# On redémarre proftpd
sudo systemctl restart proftpd

# creer les utilisateurs Merry et Pippin
sudo useradd -m -p kalimac merry
sudo useradd -m -p secondbreakfast pippin
