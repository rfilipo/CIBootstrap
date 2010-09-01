#!/bin/sh
# create an Codeigniter app tree

NARGS=1;
if [ $# -lt $NARGS ]; then
    echo
    echo "Usage: $0 nome_do_aplicativo [--remove_user_guide]";
    echo
    exit;
fi

echo 'Criando o aplicativo ...'
echo
echo 'Baixando o Codeigniter ...'
echo
#wget -O ci.zip http://www.codeigniter.com/download_files/CodeIgniter_1.7.2.zip
echo
echo 'Desempacotando'

unzip -q ci.zip

mv CodeIgniter_1.7.2 $1

echo "Criando novo aplicativo $1 ...";

if [ ! -d $1 ]; then
    mkdir $1;
fi
cd $1;

if [ ! -d 'webroot' ] ; then
    mkdir webroot;
    mv index.php webroot;
fi

if [ ! -d 'webroot/css' ] ; then
    mkdir webroot/css;
fi

if [ ! -d 'webroot/js' ] ; then
    mkdir webroot/js
fi

mv system/application application

case $2 in
    --remove_user_guide) rm -rf user_guide/;;
    *)  echo '';;     
esac

ls

