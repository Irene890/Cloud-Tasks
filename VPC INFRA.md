## VPC CREATION

The high level design shows a VPC across one Availability Zone with a public and private subnet. Each subnet contains a T3 EC2 instance. Separate security groups control the EC2 instances. Route tables are separately managed for the public 
and private subnet. A NAT gateway in the public subnet receives traffic from the private subnet. An internet 
gateway receives traffic from the public subnet.
![Image](https://github.com/Irene890/Cloud-Tasks/blob/main/vpc%20infra.png)

1. ### Created an Amazon VPC (10.0.0.0/16)
   - Enable DNS hostnames.
Assigns a friendly Domain Name System (DNS) name to Amazon EC2 instances in the VPC.

2. ### Created public subent (10.0.0.0/24) and private subnet (10.0.2.0/23)
4. Creates an internet gateway.
Configure a route table and associate it to a subnet.
Create an Amazon Elastic Compute Cloud (Amazon EC2) instance and make the instance publicly accessible.
Isolate an Amazon EC2 instance in a private subnet.
Create and assign security groups to Amazon EC2 instances.
Connect to Amazon EC2 instances using Session Manager, a capability of AWS Systems Manager.

