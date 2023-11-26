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

## SECURING AN RDS INSTANCE

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

10) Select Copy snapshot.
Snip showing an Encrypted Snapshot    
![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/14f503bc-4cc5-4aec-a494-41a003a5c5c9)
11) From the top select Manual.
12) Locate and select the new encrypted rds snapshot
13) Select Actions to toggle a dropdown menu and select Restore snapshot.
![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/2ff84c45-ea8e-410b-9fc3-6c90d55ff20c)
14) Snip to show Restoration 
![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/ffc1218c-d992-434f-8882-0f20b40e222b)
           i) _ DB engine is PostgreSQL._,
          ii)  _ Multi-AZ DB instance._
    iii) _For the DB instance identifier, enter encrypted identifier_
          iv)  _ Existing VPC security groups, select default X to remove the default, and from the dropdown menu select -DatabaseSecurityGroup-._
          v) _ For Instance configuration, select Burstable classes (includes t classes) and from the dropdown menu, select db.t3.medium._
           vi) _ Note, Enable Encryption is enabled by default._
15) Select Restore DB instance.
16) There should now be two databases displayed as captured below.
![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/a58f6c1f-2d72-4633-9428-3c586b89637a)

## Enable Connectivity to Existing EC2 Instance
1) Once the database's status is listed as Available, select the database identifier.
2) Copy the endpoint name.
3) Confirm Connectivity, Open the terminal and log in to the EC2 instance
_ssh cloud_user@<PUBLIC_IP_ADDRESS>_
4) Connect to the database
_psql -U postgres -h <endpoint name for the database>_
5) Enter the RDS master password

### Create User
1) Create guru user:
2) CREATE USER guru WITH PASSWORD 'my_passwd'; 
-Quit postgres in the terminal: \q
3) Confirm connection as the guru user:
psql -U guru -h <ENDPOINT_INFO> postgres
![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/bb7a45b1-9d06-4630-b7e1-a33300751d51)
