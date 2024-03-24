
### 1. `enable`

**Definition**: This command is used to enter privileged EXEC mode from user EXEC mode. Privileged EXEC mode provides access to all other router commands and allows you to configure operating parameters. Typically, entering this mode requires a password.

**Example**: To enter privileged EXEC mode, simply type:

```
Router> enable Router#
```

After entering `enable`, you might be prompted to enter a password, depending on the router's configuration.

### 2. `show running-config`

**Definition**: This command displays the current configuration in memory (the running configuration) of the device. It shows how the device is currently configured, including interfaces, security settings, protocols, and more. This command is used in privileged EXEC mode.

**Example**: To view the current running configuration, use:

```
Router# show running-config
```

This command will display the configuration that's currently being used by the device.

### 3. `show interface`

**Definition**: This command displays detailed information about the device's network interfaces, including status (up or down), IP address (if configured), MTU size, and much more. It's useful for troubleshooting and verifying the configuration of interfaces.

**Example**: To view detailed information about all interfaces, you can use:

```
Router# show interface
```

To view information about a specific interface, specify the interface name, like:

```
Router# show interface GigabitEthernet0/0
```

### 4. `copy run start`

**Definition**: This command is used to save the running configuration (current device configuration) to the startup configuration (the configuration the device loads when it boots up). This ensures that changes made during the current session are retained after a reboot.

**Example**: To save the running configuration to the startup configuration, use:

```cisco
Router# copy run start
```

After issuing this command, you may be prompted to confirm the action. The prompt and exact steps can vary depending on the device's configuration and IOS version.