## Virtual Private Cloud (VPC) peering
Networking connection **between 2 VPCs that enables one to route traffic between them using private IP addresses**.
Instances in either VPC can communicate with each other as if they are within the same network. 
The VPC peering can be established between VPCs in different Regions(**inter-Region**),VPCs can be in the same AWS account and in different AWS accounts.
VPC peering provides full mesh architecture.

**Benefits**
1. Private communication- Traffic is not routed over the internet
2. Easy connectivity - Resource sharing between the VPCs
3. Flexibility -> VPC peering in different regions, different AWs acoounts etc
4. Enhanced security-> Traffic is within the AWs network
5. Reduced netwrok latency -> Traffic is not routed over the ibternet 

**Points to note:**
1. VPC peering is **non-transitive**- All peering connections need to be established
2. Route tables for every VPC must be configured to route traffic to the peered VPC.
3. VPC peering can't be established with VPC with overlapping CIDR blocks
4. Security groups must be configured to allow the traffic needed between the peered VPCs.

1
Enable Flow Logs
Create flow logs on the VPCs named web-vpc and api-vpc that satisfy the following:

Capture all traffic
Send the logs to Amazon CloudWatch Logs
Logs go to a log group named flow-logs-group
Uses the IAM role named flow-log-role
Note: The flow logs can be named anything
2
Create a Private Hosted Zone
Create a private Route53 hosted zone that satisfies the following:

Named lab.private
In the US West (Oregon) region
In the web-vpc VPC

3

Create a Peering Connection
Create a peering connection between the api-vpc and web-vpc VPCs that satisfies the following:

Named api-web-pc
The api-vpc is the requester
The web-vpc is the accepter
The VPC peering request is accepted
4
Update Route Tables
Modify the route tables of the api-vpc and web-vpc so that:

The route table named web-vpc-rtb has a route for the 10.1.0.0/16 subnet
The route table named api-vpc-rtb has a route for the 10.0.0.0/16 subnet
Both routes use your peering connection as the Target
