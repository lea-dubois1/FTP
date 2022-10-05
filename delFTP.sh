#!/bin/bash

# Désinstaller proftpd avec tout ses modules, openssl et filezilla
sudo apt autoremove --purge proftpd-*
sudo apt autoremove --purge openssl
sudo apt autoremove --purge filezilla

# Supprimer le dossier ou se trouvent la clef et le certificat
rm -r /etc/proftpd/ssl 