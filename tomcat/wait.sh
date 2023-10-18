#!/bin/sh

# wait until MySQL is really available
wget -O /tmp/wait https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait
chmod +x /tmp/wait && /tmp/wait
