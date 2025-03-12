*VPC*- Virtual Private Cloud allows hosting of your own cloud infrastructure in the public cloud/ provides logical isolated section in public cloud where you can host your virtual network environment.

This VPC allows some services direct outbound access to the public internet and some services that don't.
Questions?
Subnetting?
HA subnets?

1. Created new VPC with CIDR block 10.0.0.0/16
2. Create Public Subnets for Highly Available Hosts
Create subnets that satisfy the following:

Are capable of hosting infrastructure that can directly access the public internet
Are capable of hosting highly available infrastructure
Have the word public in the subnet name tag
3. 
Create Route Tables for your Public Subnets
Create route tables for each of your public subnets that satisfy the following:

The name of each route table contains the word public
Local VPC traffic is addressable
Traffic not addressable within the VPC is routed to the public internet
4.
Create Private Subnets for Highly Available Hosts
Create private subnets that satisfy the following:

Are capable of hosting highly available infrastructure
Are not capable of routing traffic to the public internet 
Have separate route tables per availability zone
Have the word private in the subnet name tag 
5.
Create a Public Security Group
Create a security group that satisfies the following:

Contains the word public in the group's name
Has a rule that allows inbound HTTPS traffic from all sources
6.

Create a Private Security Group
Create a security group that satisfies the following:

Contains the word private in the group's name
Has a rule that allows inbound HTTP traffic from the public security group
7
Create Flow Logs for Public and Private Subnets
Create flow logs that log all traffic in your subnets to the CloudWatch Logs log group named Challenge-Flow-Logs

Note: Use the IAM role named challenge-vpc-flow-logs-role to publish logs to the log group
