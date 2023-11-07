Cockpit is a server administrations tool sponsored by Red Hat, focused on providing a modern-looking and user-friendly interface to manage and administer servers. It is easy to use, integrated, glanceable, and a open web based interface for your server that is available in most of the Linux distributions such as, CentOS, Redhat, Ubuntu and Fedora. It is intalled in Redhat 8 by default ant it is optional in Redhat 7.

It can monitor system resources, add or remove accounts monitor system usage, shut down the system and perform quite a few other tasks all through a very accessible web connection

![[Pasted image 20231106204220.png]]

### Enable Cockpit

```bash
$ yum install cockpit -y
$ systemctl start|enable cockpit
```

### Setup SSL Certificate

```bash
$ sudo openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/cockpit/ws-certs.d/cockpit-selfsigned.key -out /etc/cockpit/ws-certs.d/cockpit-selfsigned.crt -days 365
```

**Configure Cockpit to Use the TLS Certificate**:

Edit the Cockpit configuration file to specify the path to the certificate and key files:

```bash
$ sudo nano /etc/cockpit/cockpit.conf
```

In the configuration file, add or modify the following lines:

```bash
[WebService] TLSKey=/etc/cockpit/ws-certs.d/cockpit-selfsigned.key TLSCertificate=/etc/cockpit/ws-certs.d/cockpit-selfsigned.crt
```

Restart service

```bash
$ sudo systemctl restart cockpit
```

Available on https://<ip_address>:9090

