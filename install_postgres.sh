#!/bin/bash

cd $HOME

wget https://ftp.postgresql.org/pub/source/v16.0/postgresql-16.0.tar.gz

tar xzf $HOME/postgresql-16.0.tar.gz

cd $HOME/postgresql-16.0

./configure --prefix=$HOME/pgsql16 --with-pgport=5555

make && make install

cd contrib
make && make install

mkdir $HOME/pgsql16/data

export PGDATA=$HOME/pgsql16/data
export PATH=$HOME/pgsql16/bin:$PATH

initdb -U postgres -k -D $HOME/pgsql16/data

