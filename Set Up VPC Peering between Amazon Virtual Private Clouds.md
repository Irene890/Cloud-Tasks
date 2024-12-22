## Set Up VPC Peering between Existing Amazon Virtual Private Clouds

**VPC Peering** is a networking feature in AWS that allows you to establish a secure and private connection between two or more Virtual Private Clouds (VPCs). 
This connection enables resources in different VPCs to communicate with each other as if they were on the same network, using their private IP addresses.

Configurating the networking between two VPCs, one for the frontend web tier and one for the backend API tier. 

How VPC Peering Works:

1) Create a Peering Connection: You initiate a peering connection request to the owner of the other VPC.   
2) Accept the Request: The owner of the other VPC accepts the peering connection request.   
3) Configure Routing: Both VPCs need to have routing tables configured to allow traffic to flow between them.   
4) Establish Communication: Once routing is configured, resources in the peered VPCs can communicate with each other using their private IP addresses.   


![peering](https://github.com/Irene890/Images/blob/main/peering.png)


