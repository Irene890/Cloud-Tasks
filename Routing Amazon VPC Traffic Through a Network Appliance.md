## Routing Amazon VPC Traffic Through a Network Appliance
Amazon Virtual Private Cloud (VPC) gives one full control of their private network's routing. This allows one to configure sophisticated routing that involves network appliances.

A **network appliance**, also called a **Middlebox** by AWS, is a network device that can:

a) Inspect traffic metadata and content
b) Form the basis of an Intrusion Detection System (IDS) to detect malicious network activity
c) Provide real-time network traffic monitoring for reporting and real-time capacity planning

The middlebox wizard has three main use cases for inspecting traffic:

a) From the public internet to a subnet
b) From a Gateway Loadbalancer endpoint to a subnet
c) Between subnets
We'll use the Middlebox wizard to route incoming public internet traffic through a middlebox before the traffic is routed to web servers in public subnets

![routemiddle](https://github.com/Irene890/Images/blob/main/Routemiddle2.png)

A remote instance exists in its own VPC. This instance makes web requests to the web servers in the other VPC. The web servers have public IP addresses. The remote instance is used to test web server connectivity and could represent any network device on the public internet.
Incoming traffic for the web servers coming from the internet gateway will be routed through the middleboxes before reaching their destination subnets hosting the web servers.
