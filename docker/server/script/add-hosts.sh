#!/usr/bin/env sh

if grep -E 'company.dev.server|10.10.0.10' /etc/hosts;
then
  echo "\nhost 10.10.0.10\tcompany.dev.server already exists";
else
  echo "\n10.10.0.10\tcompany.dev.server" >> /etc/hosts ;
fi

if grep -E 'company.dev.db|10.10.0.20' /etc/hosts;
then
  echo "\nhost 10.10.0.20\tcompany.dev.db already exists";
else
  echo "\n10.10.0.20\tcompany.dev.db" >> /etc/hosts ;
fi

service network-manager restart