
# Nagios

> Used in Continuous monitoring.

- Server/Agent Architecture.
- There are different plugins in Nagios for different monitoring tasks. 
- Nagios Daemon periodically run scripts or pulgins as per need on the Hosts 
- So the Nagios Dameon behaves like a scheduler.

Plugins: Shell scripts that can be run from command line to check the status of host or service. Results from plugins are used to determine the current status of hosts or services.

- We write the services or parameters to monitor in a configuration file. 
- .cfg : Is the extension to store it.


### Example
`
define host { 
    use linux-server
    hostname <Client Name>
    alias   <CLient Name>
    address 192.168.0.1    
}
define service {
    use genericservice
    hostname <client name>
    service-description PING
    check_command checkPing!106.2.20%! 
}
`

> Before implementing above things we need to configure the nagios by setting admin username and password and configuration files.