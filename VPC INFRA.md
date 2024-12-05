## VPC CREATION

The high level design shows a VPC across one Availability Zone with a public and private subnet. Each subnet contains a T3 EC2 instance. Separate security groups control the EC2 instances. Route tables are separately managed for the public 
and private subnet. A NAT gateway in the public subnet receives traffic from the private subnet. An internet 
gateway receives traffic from the public subnet.

![Image](https://github.com/Irene890/Images/blob/main/vpc%20infra.png)

1. ### Created an Amazon VPC (10.0.0.0/16)
   - Enabled DNS hostnames.
Assigns a friendly Domain Name System (DNS) name to Amazon EC2 instances in the VPC.

2. ### Created public subnet (10.0.0.0/24) and private subnet (10.0.2.0/23)
   - Configured the subnet to automatically assign a public IP address for all instances launched within it.
3. ### Created private subnet (10.0.2.0/23)
4. Created an internet gateway and attach it to the VPC. Then added a route to the public subent that directs internet-bound traffic to the IGW. Also associated the public subnet with the route table.
![igw route](https://github.com/Irene890/Images/blob/main/igw.png)

5. Created a public SG to allow http traffic - Users can access teh EC2 instances. 
6. Launched an Amazon Elastic Compute Cloud (Amazon EC2) instance and made the instance publicly accessible.
   - Selected role EC2InstProfile - since we'll log in using SSM
   - Provided the user data to install and configure the instance as a Web server
Isolate an Amazon EC2 instance in a private subnet.
Create and assign security groups to Amazon EC2 instances.
Connect to Amazon EC2 instances using Session Manager, a capability of AWS Systems Manager.

