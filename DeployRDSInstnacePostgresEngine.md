## Objective
Deploy a new RDS instance with Postgres Engine to be used for testing a new application. 
i) Deploy a single-AZ RDS instance
ii) Enable connectivity to existing EC2 Instance.
iii) Confirm connectivity.
## Diagram Illustrating the above:

![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/8d2747cd-1148-4413-b850-aef918f974e7)

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
_psql -U postgres -h <endpoint name for the database> postgres_
Enter the master password that you used when creating the RDS instance. 
Link below shows the connection was successful.
![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/17cafc84-91fd-4cc2-8dc2-f5b15dd97970)

# SECURING AN RDS INSTANCE

![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/1ad5050e-c5c7-472a-8504-4e7cf5050913)

1) Select RDS from the Services
2) Select Databases to view the database instance with an available status.
3) In the left-pane Amazon RDS menu, select Snapshots.
4) Select System.
5) Locate the snapshot and click the box to select the snapshot.
6) Toggle a dropdown menu and select Copy snapshot.
7) In the New DB Snapshot Identifier field, enter enc-rdsinstance.
8) Enable Encryption.
![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/ec8b78ab-8149-480e-8fb3-bac37dc11657)

10) Select Copy snapshot.Snip showing an Encrypted Snapshot
    
![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/14f503bc-4cc5-4aec-a494-41a003a5c5c9)
