logmon with supervisord
======

## Setup
```
./setup.sh
```

If 'no such process' error is shown, please reload supervisord daemon."

## Operations
### Start/Stop/Reload
```
# systemctl start logmon.service
# systemctl stop logmon.service
# systemctl reload logmon.service
```

## Configuration
### Configuration file
/etc/logmon/logmon.conf

### Basic format
```
:Message File
(Keywords)
Actions
```

<%%%%> is replaced with the line matched.

### Example
```
# Monitor for messages
:/var/log/messages
(Error|ERROR|error)
echo "<%%%%>" | mail -s "Error in /var/log/messages" -r system@example.com admin@example.com 
/usr/bin/wall "Error in /var/log/messages"

(Warn|warn)
echo "<%%%%>" | mail -s "Warning in /var/log/messages" -r system@example.com admin@example.com

# Monitor for secure
:/var/log/secure
(authentication failure)
echo "<%%%%>" | mail -s "Authentication failure" -r system@example.com admin@example.com
```

You can check if the config file is parsed as intented.
```
# /etc/logmon/logmon.pl -c
Config file: /etc/logmon/logmon.conf

Logfile: /var/log/messages
  Message: (Warn|warn)
    Action: echo "<%%%%>" | mail -s "Warning in /var/log/messages" -r system@example.com admin@example.com
  Message: (Error|ERROR|error)
    Action: echo "<%%%%>" | mail -s "Error in /var/log/messages" -r system@example.com admin@example.com
    Action: /usr/bin/wall "Error in /var/log/messages"

Logfile: /var/log/secure
  Message: (authentication failure)
    Action: echo "<%%%%>" | mail -s "Authentication failure" -r system@example.com admin@example.com
```
