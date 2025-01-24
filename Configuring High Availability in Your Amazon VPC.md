## Configuring High Availability in Amazon VPC
*AWS* provides services and infrastruvture to build *reliable*, *fault-tolerant* and *highly available* systems in the cloud.
Fault tolerance is a system's availability to remain in operation even if some of the components in that system fail.
While high availability is the ability of the system to recover quickly from system failure.
Architects must prioritize high availability and fault tolerance in their system designs.
1. *Elastic Load Balancing* distributes incoming traffic across multiple instances in different Availability Zones (AZs). This ensures that if one AZ fails, traffic is automatically routed to instances in other AZs, minimizing downtime. It also integrates well with *Auto scaling groups* to automatically adjust number of instances based on traffic load.
2. *ELB* is attached to the Auto scaling group, this acts as a single point of contact for all incoming traffic.
3. *ELB* continuously monitors the health of target instances. If an instance becomes unhealthy, it is automatically removed from the load balancing pool, preventing it from receiving traffic.
4. *Auto Scaling Group* allows you to automatically adjust the number of instances in reponse to changes in demand. Ensure cost efficieny, scales down idle instances and scales out instances when needed. 
HA comes when ASG replaces failed instances with new inatnces. It uses *Configuration Template* where the instances specification like AMIs, user data are defined.
5. For apps that require session state, *ELB* maintains session affinity, ensuring that requests from a specific client are consistently routed to the same instance.
6. *NAT GW* allows instances in a private subnet to connect to the internet while preventing the internet from initiating connections with those instances.
7. *Amazon RDS Multi-AZ* ensures the database is deployed across multiple AZs, maintans continuous replication.
8. *RDS Failover Mechanism*: In case of a primary instance failure, RDS automatically fails over to the standby instance, minimizing downtime.

![HAFT] (https://github.com/Irene890/Images/blob/main/HA%20FT%20vpc.png)

Created a launch template that'll be used by ASG to launch EC2 instances depending with traffic
Created an EC2 ASG and registered it with the Application Load Balancer spanning 2 AZs-- it is designed to launch or terminate EC2 instances in private instances automatically based on user-defined policies, schedules, and health checks. This is a security best practice when deploying applications because instances in a private subnet cannot be accessed from the internet. Auto Scaling is a service designed to launch or terminate EC2 instances automatically based on user-defined policies, schedules, and health checks. Configured desired, minimum and maximum capacity to 2 each. This maintains the application’s availability and makes it resilient to instance or Availability Zone failures.
Created a highly available Aurora DB cluster
Modified the VPC config to be highly available by using redundant NAT gateways.
Created Aurora read replica in different region.

