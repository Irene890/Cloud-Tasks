## Overview

AWS provides services and infrastructure to build reliable, fault-tolerant, and highly available systems in the cloud. 
*Fault tolerance* is a system’s ability to remain in operation even if some of the components used to build the system fail. 
*High availability* is the ability of the system to recover quickly from sytem failure. As an AWS solutions architect, it is important to design the systems to be highly available and fault tolerant when needed. 
Here, we have integrated two powerful AWS services: Elastic Load Balancing and Auto Scaling groups. 
We created an Auto Scaling group of Amazon EC2 instances operating as application servers. 
Then configured an Application Load Balancer to load balance between the instances inside that Auto Scaling group. 
Created an Amazon Relational Database Service (Amazon RDS) by permitting Multi-AZ, creating a read replica, and promoting a read replica. 
With *read replicas*, you can write to the primary database and read from the read replica. 
Because a read replica can be promoted to be the primary database, it is a useful tool in high availability and disaster recovery.
