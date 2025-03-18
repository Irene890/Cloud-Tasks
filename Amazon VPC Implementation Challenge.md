## VPC Implementation
**VPC**- Virtual Private Cloud is an isolated segment of the AWS public cloud that allows you to provision your cloud resources. 
Only allowed 5 VPCs per Region/per AWS Account.

This VPC allows some services direct outbound access to the public internet and some services that don't.
Questions?
Subnetting?
HA subnets?

1. Created new VPC with CIDR block 10.0.0.0/16
**IP addresses** allow resources in the network to communicate with each other and with the internet.
3. Created 2 Public Subnets for Highly Available Hosts
   **Subnet**- range of IP addresses. Subent resides within a **single AZ**.
   - One can add resources after adding the subnets.
4. Created Route Tables for the Public Subnets
   **Route Tables** determines where traffic in the subnet is directed to
Create route tables for each of your public subnets that satisfy the following:

5. Created **Private Subnets** for Highly Available Hosts
- Resources in the private subnet do not have direct router to the internet.
- Resources in the private subnet require a NAT devices to access the public internet.

7. Created a Public Security Group
Created a rule that allows inbound HTTPS traffic from all sources
8. Created a Private Security Group
Created a rule that allows inbound HTTP traffic from the public security group
9. Created Flow Logs for Public and Private Subnets
**Flow logs** - log all traffic in the subnets to the CloudWatch Logs log group named Challenge-Flow-Logs

Note: Use the IAM role named challenge-vpc-flow-logs-role to publish logs to the log group
