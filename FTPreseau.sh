#!/bin/bash

# installer proftpd avec tout ses modules, openssl et filezilla
apt-get install proftpd-*
apt-get install openssl
apt-get install filezilla

# Creer le dossier SSL et y generer la clef et le certificat
mkdir /etc/proftpd/ssl
openssl req -x509 -newkey rsa:2048 -keyout /etc/proftpd/ssl/proftpd.key.pem -out /etc/proftpd/ssl/proftpd.cert.pem -nodes -days 365


# modifier les fichier de conf : proftpd.conf ; tls.conf et modules.conf
cp /home/lea2/Documents/FTP/Job7/modules.conf /etc/proftpd/modules.conf
cp /home/lea2/Documents/FTP/Job7/proftpd.conf /etc/proftpd/proftpd.conf
cp /home/lea2/Documents/FTP/Job7/tls.conf /etc/proftpd/tls.conf

# On redémarre proftpd
systemctl restart proftpd

# creer les utilisateurs Merry et Pippin
useradd -m -p kalimac merry
useradd -m -p secondbreakfast pippin
