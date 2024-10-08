## Investigating with Data

*Note*: Review videos for log examples and finding attacks

**SIEM**: Combination of different data sources into one tool that provides real-time analysis of security alerts generated by applications and network hardware

**Log File**: A file that records either events that occur in an operating system or other software that runs, or messages between different users of a communication software

**Syslog/Rsyslog/Syslog-ng**: Variations of syslog which all permit the logging of data from different types of systems in a central repository (***Linux and Unix***)

**Journalctl**: Linux command line utility used for querying and displaying logs from the journald, which is responsible for managing and storing log data on a Linux machine

**NXLog**: A multi-platform log management tool that helps to easily identify security risks, policy breaches, or analyze operational problems (***Unix, Linux, and Windows***)

**NetFlow**: Network protocol system created by cisco that collects active IP network traffic as it flows in or out of an interface, including its point of origin, destination, volume, and paths on the network

**SFlow**: ***Sampled Flow***, Provides a means for exporting truncated packets, together with interface counters for the purpose of network monitoring (***Open-Source NetFlow***)

**IPFIX**: ***Internet Protocol Flow Information Export***, Universal standard of export for Internet Protocol flow information from routers, probes, and other devices that are used by mediation systems, accounting and billing systems, and network management systems to facilitate services
- Backend of service management

**Metadata**: Data that describes other data by providing an underlying definition or description by summarizing basic information about data that makes finding and working with particular instances of data easier

## Data Vestibules 

**Vulnerability Scan**: Generates scan reports automatically 
- Review the vulnerability scan results to confirm if the detected vulnerabilities actually exist in the system

**Packet Capture**: Gather all data sent to or from a specific network device
- Used to detect syn flood, port scans, ddos, etc...\

**Firewall Logs**: Logs generated by a hardware/software firewall with the information about traffic requests on the  given network segment it moderates

**Application Logs**: Created for every single application you have on your system logged directly inside the applications folder itself or they may be consolidated centrally inside of your logging system, such as a SIEM or Syslog server

**Endpoint Logs**: an Endpoint system refers to any device that connects to a network. Endpoint logs are records generated by endpoint systems that provide detailed information about the activities and events occurring on those devices

**OS Security Logs**: type of log file generated by an operating system (OS) to record security-related events. These logs are crucial for monitoring and managing the security of an operating system, providing detailed information about user activities, system changes, and other events that could affect the security posture of a device or network. Such as identifying password cracking attempts

**IPS/IDS Logs**: logs generated by **Intrusion Prevention Systems (IPS)** and **Intrusion Detection Systems (IDS)**. These logs are vital components of cybersecurity as they help monitor, detect, and respond to potential threats and unauthorized activities on a network.

**Network Logs**: generated by various network devices and systems that capture events, activities, and traffic patterns across a network. These logs are crucial for monitoring, analyzing, and securing network environments, providing insights into network performance, usage, and security incidents.