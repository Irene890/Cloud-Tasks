## VPC Implementation
**VPC**- Virtual Private Cloud is an isolated segment of the AWS public cloud that allows you to provision your cloud resources. 
Only allows **5** VPCs per Region/per AWS Account.

**Subnetting**: Process of splitting a CIDR block into smaller CIDR blocks
Maximum CIDR block: /16
Minimum CIDR block: /28
*AWS reserves 5 host addresses: 1) VPC router 2)AWS DNS 3)Future Use 
4)Network address 5) Broadcast address

Why Subnet?: Security, Accessibility (Private & public), Communication, High Availability,Ease of management

- AWS uses the **longest prefix match/most precise route** to route traffic.

  ## VPC Challenge
1. Created VPC with CIDR block 10.0.0.0/16
**IP addresses** allow resources in the network to communicate with each other and with the internet.
3. Created 2 Public Subnets for Highly Available Hosts
   **Subnet**- range of IP addresses. Subnet resides within a **single AZ**.
   - One can add resources after adding the subnets.
4. Created Route Tables for the Public Subnets
   **Route Tables** determines where traffic in the subnet is directed to.
Created route tables for each of the public subnets.

5. Created **Private Subnets** for Highly Available Hosts
- Resources in the private subnet do not have direct access to the internet.
- Resources in the private subnet require a NAT devices to access the public internet.

7. Created a Public Security Group
- Created a rule that allows inbound HTTPS traffic from all sources.

9. Created a Private Security Group
- Created a rule that allows inbound HTTP traffic from the public security group

11. Created Flow Logs for Public and Private Subnets.
**Flow logs** - logged all IP traffic in the subnets.
- Flow logs can be created for Subnets, entire VPC or interfaces.
- Logs sent to the CloudWatch Logs log group named Challenge-Flow-Logs, where one can filter information and monitor specific metrics.
- Used the IAM role named challenge-vpc-flow-logs-role to publish logs to the log group in Cloudwatch
