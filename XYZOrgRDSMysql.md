# RDS Introduction
## What is RDS?  ![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/83e30a38-048b-491e-b333-cac56e7b1c9e) 
It's a managed database option for MySQL, Maria, PostgreSQL, Microsoft SQL Server, Oracle and MySQL-compatible Aurora. -Best for structured, relational data store needs. -Offers automanted backups and patching in customer-defined maintenance windows.
A **DB engine** is the specific relational database software that runs on your DB instance.
Amazon RDS supports the following engines:MariaDB, Microsoft SQL Server, MySQL, Oracle and PostgreSQL
- RDS scales vertically (increasing the compute and memory resources of a database instance).

##### Amazon RDS Read Replica:
Purpose:Read replicas are used to offload read operations from the primary DB instance, improving overall performance.
They can also be used to enhance availability by promoting a read replica to the primary if needed.

##### Amazon RDS Snapshot:
Purpose: Backup and Recovery: Snapshots are primarily used for creating backups of your DB instance.
Point-in-Time Restore: They allow you to restore your database to a specific point in time.

#### Instance classes
1) Standard (m classes,m5).
2) Memory Optimized (r and x classes, rb5).
3) Burstable (T class, not suitable for production).

### RDS Proxy -manages connections to the databases more efficiently.
-- Acts as an intermediary between the application and the RDS.

### Building Resiliency in RDS (ability of systems to recover quickly in the face of failure)
- Create read replica   - Configure proxy   --Manually scale EC2 instance

## CHALLENGE: PROJECT SCOPE
The project scope encompasses the end-to-end implementation of Amazon RDS (Relational Database Service) with MySQL as the preferred database engine within XYZ Corporation.
The project scope aims to provide XYZ Corporation with a fully functional, secure, and scalable RDS MySQL database environment, meeting the specified requirements and
supporting the organization's growth objectives. The scope is subject to periodic review and adjustments based on project progress and emerging organizational needs.
Success Criteria.
_The success of the Amazon RDS with MySQL implementation at XYZ Corporation will be measured against the following criteria:_
##### 1. Database Functionality:
- The RDS MySQL database is fully functional, meeting the specified requirements and providing reliable data storage and retrieval capabilities.
##### 2. Data Migration Success:
- Successful migration of existing data to RDS MySQL with minimal downtime and data integrity maintained throughout the process.
##### 3. System Integration:
- Seamless integration of RDS MySQL with existing systems and applications, ensuring compatibility and interoperability.

## PROJECT SOLUTION
- We will start by creating a database MySQL client for demonsttion purposes.

## Creating XYZ RDS Database Client
1) In the AWS console, select EC2
2) Scroll down, click _launch instance_
3) Enter the name of the db client _xyzdbclient
4) Select _proceed without keypair_ in the keypair section
5) All other settings are left intact
6) Select _Launch instance _
_
## Deploying a High Available XYZ RDS 
1) In the RDS console, click the_ Create database_ button.
2) Ensure _Standard create_ is selected
3) In the Engine type section, select _MySQL_.
**Engine Type:**
  ![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/7c985e14-d879-4ad5-8188-4c2f4e102492)

5) Scroll down to the _Engine Version_ select: 8.0.32. 
6) In the Templates section, select Dev/Test or Production for Multi-AZ. Otherwise _Free tier_ if you want to save cost, this is Single AZ (Can still add additional read-only instances once the primary is up and running.)
7) Set the DB instance identifier to _primary-instance_
8) In the credential settings, set the_ Master Username & password_. Note it down, will be used to login to the db later on.
9) In Instance configuration, select _Burstable classes_ (save on cost), Storage leave it at 20Gb.
![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/e676284d-4ce4-4ab5-8e17-447a45ade0b9)

10) Select the Radio button, _Connect to an EC2 compute Resource_. Since we already created an EC2 instance 
11) Under Connectivity, select the EC2 instance created-_xyzdbclient
12) Amazon RDs will automatically add a new vpc Security group.
![image](https://github.com/Irene890/Cloud-Tasks/assets/133228414/51b14f4d-ccb4-41cf-9423-446f411d9df3)

13) Enable enhanced monitoring.
14) Enable automated backups.
15) Enable encryption.
16) Click Create DATABASE.


### Connect using mysql client
1)	Click the EC2 Instance Connect button.
2)	Wait for the connection to the EC2 instance to be established.
3)	Run the command: _sudo yum update -y_ (updates the instance package)
4)	Run the command: install the mysql client: _sudo yum install mysql	_
- Wait for the installer report to complete
5) Open the RDS client console. Click on the new database instance to open its details.
6) Under the **Connectivity & security tab**, copy the value for _Endpoint_.
- Endpoint will be used to connect to the RDS
7) Head over to the EC2 console, run the command below and include the endpoint copied in (6)
_mysql -h <RDS Endpoint Value> -P 3306 -u admin -p	mysql_ 
Enter the password you used to create the DB
8) Run the commands below to see the available databases on the instances:
_show databases;__
__use mysql;_
_show tables;_
_select * from user;_

_**In case a Free Tier was used in creating the DB, that means it's in Single AZ. _
_We'll therefore need to create a Read replica for higher availability.**_

### Adding a Read Replica
1) Switch to the RDS console page.
2) Find the db you created *primary-instance databases 
3) Select the Primary DB, click the button labeled Actions, and then from the drop-down menu, select Create read replica.
4) Scroll down to the Network & Security section.
5) Click the drop-down and select an AZ other than where the primary instance is located
6) Ensure the Read replica source is primary-instance.
7) Set the DB instance identifier to readonly-instance (now identified as readonly-instance)
8) Click Create read replica.	
9) To see the Readonly instance in the console session running mysql....run the command:
__show slave hosts;_ (A table is printed showing the RO instance)
