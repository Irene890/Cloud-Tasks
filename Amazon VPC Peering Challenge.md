## Virtual Private Cloud (VPC) peering
Networking connection **between 2 VPCs that enables one to route traffic between them using private IP addresses**.
Instances in either VPC can communicate with each other as if they are within the same network. 
The VPC peering can be established between VPCs in different Regions(**inter-Region**),VPCs can be in the same AWS account and in different AWS accounts.

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
