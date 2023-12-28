#start server
pg_ctl start -l $HOME/logfile

#check
psql -U postgres -p 5555 -c 'SELECT now()'

#stop server
pg_ctl stop -m fast

