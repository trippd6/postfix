# postfix

I was looking for a way to run postfix in a container. Unfortunately it has a master process that then forks specialized processes when nessary. It requires syslog.

This container spins up postfix via chaperone. Chaperone starts/monitors the master pid. It handles signals correctly. It sends all the syslog to stdout. It also regenerates the transport db file at start, in case you need that (I do)

I haven't found anyone doing this a better way, so I thought I would share.

You'll want to mount a volume for the spool in /var/log/spool/postfix and  mount in your config files into /etc/postfix. Configuration is up to you.

