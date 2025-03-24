## Virtual Private Cloud (VPC) peering
Networking connection **between 2 VPCs that enables one to route traffic between them using private IP addresses**.
- Instances in either VPC can communicate with each other as if they are within the same network. 
- The VPC peering can be established between VPCs in different Regions(**inter-Region**),VPCs can be in the same AWS account and in different AWS accounts.
- VPC peering provides full mesh architecture.
- **Routing in VPC Peering:** Subnets in both VPCs must include a route to subnets in the peered VPC using the pcx.
- VPC peering doesn't support unicast reverse path forwarding (Checking source IP of packets and routes packet back to the correct source)

**Benefits**
1. Private communication- Traffic is not routed over the internet
2. Easy connectivity - Resource sharing between the VPCs
3. Flexibility -> VPC peering in different regions, different AWs acoounts etc
4. Enhanced security-> Traffic is within the AWs network
5. Reduced netwrok latency -> Traffic is not routed over the internet 

**Points to note:**
1. VPC peering is **non-transitive**- All peering connections need to be established
2. Route tables for every VPC must be configured to route traffic to the peered VPC.
3. VPC peering can't be established with VPC with overlapping CIDR blocks
4. Security groups must be configured to allow the traffic needed between the peered VPCs.

# Infrastructure has been configured as below:

- Two VPCs named web-vpc and api-vpc have been deployed
- Autoscaling groups exist in both VPCs and are configured to launch servers
- Load balancers have been deployed in each VPC
- The web application has been modified to access the API through the domain name **api.elb.lab.private**
![VPC peering architecture](https://github.com/Irene890/Images/blob/main/VPC%20Peering%20Archi.png)

## Tasks to complete:
1. Enabling flow logs on both VPCs to make debugging connectivity issues easier
2. Creating an Amazon Route53 private hosted zone in the Web VPC
3. Creating a record in the private hosted zone for the API load balancer
4. Creating a peering connection between the VPCs
5. Updating the route tables of the VPCs to enable routing between them

- api-vpc cidr: 10.1.0.0/16
- web vpc cidr: 10.0.0.0/16
- API Load Balancer: api-elb
- Web Load Balancer: web-elb

Steps Taken:
1. Enabled Flow Logs
Created 2 flow logs on the VPCs named web-vpc and api-vpc.
These VPC Flow logs: Capture all traffic, Sent the logs to Amazon CloudWatch Logs, Logs go to a log group named flow-logs-group, Uses the IAM role named flow-log-role
![API Flow log](https://github.com/Irene890/Images/blob/main/api-flow-log.png)
![Web Flow log](https://github.com/Irene890/Images/blob/main/web-flow-log.png)

2. Created a Private Hosted Zone
- Private Route53 hosted zone is a feature that helps one to manage the internal DNS records [Translates domain names to IP addresses, DNS quesries originates from the selected VPC only,
- Associated it with Web-vpc in US West (Oregon) region.
![Private hosted zone](https://github.com/Irene890/Images/blob/main/Route%2053%20private%20hosted%20zone.png)
- Created a cName record that uses the DNS name of the load balancer named api-elb in the API VPC for the record's value, uses the Simple routing policy and has a TTL of 300 seconds
![Cname record](https://github.com/Irene890/Images/blob/main/CNAME%20record.png)

3. Created a Peering Connection between the api-vpc and web-vpc VPCs that satisfied the following:
- The api-vpc as the requester
- The web-vpc as the accepter
  
4. Updated Route Tables to include the peering routes for both
**API Route added in the Web Route table**
![API route addition](https://github.com/Irene890/Images/blob/main/web%20route%20added%20api%20route.png)
**Web Route added in the API Route table**
![Web route addition ](https://github.com/Irene890/Images/blob/main/api%20route%20added%20web%20route.png)

