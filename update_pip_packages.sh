#!/bin/bash

pip_outdate_pkgs=$(pip freeze | sed -e 's/=.*//g')
for i in $pip_outdate_pkgs; do
  pip install --upgrade "$i"
done
