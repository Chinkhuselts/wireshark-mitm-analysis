   # Wireshark MitM Analysis Project Report

   ## Introduction
   This project simulates a Man-in-the-Middle (MitM) attack using ARP poisoning, captures traffic with Wireshark, and analyzes packets to identify malicious behavior, showcasing skills in packet analysis and network security.

   ## Problem Statement
   MitM attacks intercept sensitive data, compromising network security. Analyzing such attacks helps understand attacker techniques and develop defenses.

   ## Tools
   - **Wireshark**: Packet capture and analysis.
   - **Arpspoof**: ARP poisoning for MitM.
   - **Ubuntu 22.04 LTS**, **VirtualBox**, **Nmap**.

   ## Implementation
   - **Setup**: Configured three VMs (Victim: `192.168.227.164`, Target: `192.168.227.93`, Attacker: `192.168.227.50`) on a VirtualBox NAT network.
   - **Attack**: Performed ARP poisoning with:
     ```bash
     sudo arpspoof -i ens33 -t 192.168.227.164 -r 192.168.227.93
     sudo arpspoof -i eth0 -t 192.168.227.93 -r 192.168.227.164
     ```
   - **Capture**: Used Wireshark to capture traffic on `eth0`.
   - **Analysis**: Filtered for `arp` and `http` to identify poisoning and intercepted data.

   ## Results
   - **Captured Packets**:
     - ARP replies showing Attacker’s MAC spoofing Target’s IP.
     - SSH(port 22) packets with cleartext data from Victim.
   - **Sample Analysis**:
     - ARP: Attacker (`192.168.227.50`) sent replies claiming to be `192.168.227.93`.
     - SSH: Captured `SSH` command from Victim to Target.
   - **Mitigation**: Enable ARP spoofing detection, use encrypted protocols (e.g., HTTPS).

   ## Key Takeaways
   - **Packet Analysis**: Wireshark filters (e.g., `arp.opcode == 2`) are critical for identifying MitM indicators.
   - **Attack Mechanics**: ARP poisoning exploits weak protocol trust.
   - **Defense**: Encryption and static ARP tables prevent MitM attacks.

   ## Portfolio Components
   - **Portfolio**: [https://Chinkhuselts.github.io](https://Chinkhuselts.github.io).
      ## Future Enhancements
   - Analyze encrypted protocols (e.g., SSL/TLS).
   - Integrate Snort for MitM detection.
   - Test DNS spoofing in MitM scenarios.

   ## Conclusion
   This project demonstrates my ability to simulate, capture, and analyze a MitM attack, reinforcing my cybersecurity expertise.
   **Author**: Chinkhuselts  
   **GitHub**: [github.com/Chinkhuselts](https://github.com/Chinkhuselts)
