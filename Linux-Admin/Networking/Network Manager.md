
NetworkManager is a service that provides a set of tools designed specifically to make it easier to manage the networking configuration on Linux systems and is the default network management service on RHEL8 and RHEL 9. It makes network management easier, provides easy setup of connections to the user, and offers management through different tools such as GUI, nmtui, and nmcli
### Network Configuration Methods

1. **nmcli (NetworkManager Command-Line Interface)**:
    
    - **Description**: `nmcli` is a command-line interface for NetworkManager, a Linux network management service. It allows users to control and configure network connections from the terminal.
    - **Use Cases**: You can use `nmcli` to manage various network tasks, including connecting to Wi-Fi networks, configuring wired connections, setting up VPNs, and viewing network status. It is especially useful for scripting and automation.
    
2. **nm-tui (NetworkManager Text User Interface)**:
    
    - **Description**: `nm-tui` is a text-based user interface for NetworkManager. It provides a more user-friendly way to manage network connections compared to `nmcli`.
    - **Use Cases**: `nm-tui` is a helpful tool when working on a Linux system with a terminal interface, such as on servers or systems without a graphical user interface (GUI). It simplifies the process of configuring and managing network connections.

3. **nm-connection-editor (NetworkManager Connection Editor)**:
    
    - **Description**: `nm-connection-editor` is a graphical utility provided by NetworkManager. It allows users to create, edit, and manage network connection profiles in a GUI environment.
    - **Use Cases**: `nm-connection-editor` is commonly used on Linux desktops with graphical interfaces, such as GNOME or KDE, to configure network settings. It simplifies tasks like setting up Wi-Fi connections, VPNs, and modifying connection properties.

4. **GNOME Settings (GNOME Control Center)**:
    
    - **Description**: GNOME Settings, also known as GNOME Control Center, is the central configuration utility in the GNOME desktop environment for Linux. It provides access to various system and user settings, including network settings.
    - **Use Cases**: In the context of network management, GNOME Settings allows users to configure network connections, proxy settings, privacy options, and more. Users can access Wi-Fi settings, wired connections, VPNs, and network proxy settings through the GUI-based interface.

