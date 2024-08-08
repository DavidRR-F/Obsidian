## DoS Attack

Used to describe an attack that attempts to make a computer or server's resources unavailable

**Flood Attack**: Specialized type of DoS which attempts to send more packets to a single server or host

- ***Ping Flood***: a variety of flood attack in which a server is sent with too many pings (ICMP echo)
	- Disable ICMP

- ***SYN Flood***: An attacker will initiate multiple TCP sessions but never complete the three-way handshake
	- Use Flood Guards
	- Timeout requests
	- IPS

**PDoS**: Permanent Denial of Service attack which exploits a security flaw by reflashing a firmware, permanently breaking networking devices

**Fork Bomb**: A large number of processes is created to use up a computer's available processing power

**DDoS**: Distributed Denial of Service, more machines are used to launch an attack simultaneously against a single server to create denial of service condition

- ***DNS Amplification Attack***: Specialized DDoS that allows an attacker to initiate DNS requests from a spoof IP address to flood a website

### Mitigations

**Blackhole/Sinkhole**: Identifies malicious IP addresses and routes there traffic to a non-existent server

- IPS
- Elastic Cloud Infrastructure

# Review Questions

```aosr-deck-config
{
	"rule": {
		"conditions": {
			"all": [{
				"fact": "card",
				"operator": "regexMatch",
				"value": "Malicious Activity",
				"path": "$.path"
			}]
		},
		"event": {
			"type": "match"
		}
	}
}
```

## Questions

