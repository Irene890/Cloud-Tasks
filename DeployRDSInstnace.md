## Objective
Deploy a new RDS instance to be used for testing a new application. 
_i) Deploy a single-AZ RDS instance._
_ii) Enable connectivity to existing EC2 node._
_iii) Confirm connectivity._
##_ Diagram Illustrating the above:_
_https://drive.google.com/file/d/1KE13NDVSuJhTNA4SOFczGmG5G6IH3zj0/view?usp=sharing_

# Deploy RDS Instance
1) In AWS Management Console, select RDS.
2) Click the Create database button.
3) Under Chose a database creation method, select Standard create.
4) Under Engine options, select PostgreSQL.
5) Under Templates, select Dev/Test.
6) Under Availability and durability, select Single DB instance.
7) Under Master password, enter an easy-to-remember password of your choice.
8) Under Instance configuration, select Burstable classes.
9) In the dropdown menu, select db.t3.medium.
10) Under Storage, select General Purpose SSD (gp2) from the dropdown menu.
11) Under Connectivity, select Connect to an EC2 compute resource.
12) In the EC2 instance dropdown menu, select the existing instance.
13) Under DB subnet group, select Automatic setup.
14) Under VPC security group (firewall), select Create new, enter a new name for the RDS SG
15) Click Create database button.

## Enable Connectivity to Existing EC2 Instance
1) Once the database's status is listed as Available, select the database identifier.
2) Under Endport & port highlighted in the below link, copy the endpoint name.
![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/f70f24ca-c750-4b0a-b8e8-b865cdb35ad2)
4) Confirm Connectivity, Open the terminal and log in to the EC2 node
_ssh cloud_user@<PUBLIC_IP_ADDRESS>_
5) Connect to the database, pasting in the endpoint name of your database
_psql -U postgres -h <endpoint name for your database> postgres_
Enter the master password that you used when creating the RDS instance. 
Link below shows the connection was successful.
_https://drive.google.com/file/d/1_QLRtEfYFaDTa6au6zqzdFIzjZedSvbU/view?usp=sharing_
https://drive.google.com/file/d/1u4DqvjjrQpOEEvFq80x8fENlg6DFL428/view?usp=sharing
