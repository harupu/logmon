logmon
======

## Setup
```
./setup.sh
```

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

<%%%%> is replaced with the line of message.

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
