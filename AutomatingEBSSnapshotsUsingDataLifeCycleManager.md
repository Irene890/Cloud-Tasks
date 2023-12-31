## Problem Statement:
An organization operating in a cloud-based infrastructure, relying on Amazon Web Services (AWS), needs an efficient solution to take daily snapshots of its Amazon Elastic Block Store
(EBS) volumes. Currently, the process of creating snapshots is manual, time-consuming, and error-prone. The organization seeks to implement an automated system for taking daily EBS
volume snapshots to improve data backup and recovery processes and ensure business continuity.

## Below is the Diagram link illustrating the solution using Amazon Lifecycle Manager 
https://drive.google.com/file/d/12buA2kKXdeLl2IH5FVncCGYf-4BUNaRr/view?usp=sharing

# AMAZON LIFECYCLE MANAGER 
--Provides a simple, automated way to back up data stored on Amazon EBS volumes.
## Benefits
1) Automated snapshot and AMI creation
2) Fast snapshot restore integration
3) Built-in cross-Region copy- Automatically copy snapshots that are created by a lifecycle policy to up to three AWS Regions.
4) Automated cross-account snapshot copy

# Automating EBS Snapshots Using Life Cycle Manager
STEPS:
1) Launch an EC2 instance with an attached EBS volume
2) Create Lifecycle policy within DLM
3) Schedule / Enable Cross-Region replication of the EBS snapshot

## STEP 1 EXPLAINED::: Launch an EC2 instance with an attached EBS volume
-Log in to your free tier AWS A/C
- Launch instance, name of instanceEC2DLMInstance, Amazon Linux OS (Free tier),
Instance type-t2.micro (Free tier)
-Proceed without key pair
-Configure storage--Add new volume--10 Gig gp3
Launch Instance, wait for it to set up
- Add tag to the 10 Gig volume under EBS-Volumes--name it:EBSDLMVolume

## STEP 2 -Create Lifecycle policy within Lifecyle Manager
-Under EBS, select LifeCycle Manager
-Create EBS snapshot policy, click Next step
-Target Resources: Volume
- Tag Resource Tags: EBSDLMVolume
- Description: EBSDLMVolume
- Use default IAM role that enables: "Create,Delete, Describe,Copy,Modify snapshots,DescribeInstances",DescribeVolumes etc
- Assign Tags: Key:Name Value-DLMPolicy      Key: CreatedBy     Value: Irene
- Policy Status: Enabled ( To immediately start creating snapshots)
- Click Next

## STEP 3- Schedule/ Enable Cross-Region replication of the EBS snapshot
Schedules define how often the policy runs and the specific actions that are to be performed.
- Give a name to your schedule. Schedule name:EBS-Daily-Snapshots
- Frequency : Daily
- Every: 24 hours
- Starting at--input the time (09:23)
- Retention Type:Count or age
count: 2 copies

## Under Advanced Details:
- Tagging (Specify the tags that are to be applied to snapshots created by this schedule.)- Select Copy Tags from source
- Can also enable Fast snapshot restore
- Enable Cross-Region copy for this schedule--us-east-1
---Select the Target region i.e) us-east-1, to expire in 1 day after creation
- KMS Encryption for snapshot is enabled
REVIEW POLICY then CREATE POLICY

**************************************************************************************************************************
# EBS SNAPSHOT EVENTS:

Amazon EBS sends events to EventBridge when the following volume events occur:createSnapshot,createSnapshots,copySnapshot and shareSnapshot.

## Create an Amazon SNS Topic:
1) Select SNS in AWS console
2) Click on Create Topic
3) Enter topic name 
4) Click Create Topic to create the SNS topic.
5) Create a Subscription for the SNS Topic
6) Select the newly created SNS topic.
7) Click on Create Subscription
8) Choose the protocol for notification: Email 
9) Enter the recipient's email address and confirm it
10) Click Create Subscription

 ## Amazon EventBridge Rule:
1) Open the Amazon EventBridge
2) Choose Rules, and then choose Create rule.
3) Enter values for Name and Description.
4) For Event bus-default.
5) For Event type, select Rule with an event pattern.
6) For Event source, select AWS events or EventBridge partner events.
7) For AWS service, select EC2.
8) For Event type, select EBS Snapshot Notification, you can further choose a Specific event(s) i.e) createSnapshot.
9) For Target types, choose AWS service.
10) For Select target, choose SNS Topic function, and for select the topic that you created earlier.
11) Configure tags
12) Review Policy, then Creat Rule

Immediately the snapshot is created , an email is sent to the email entered.

*****************************************************************************************************************
## DELETE
a) Delete Rule
b) Delete SNS Subscription
c) Delete SNS Topic
d) Delete snapshots in both regions.
e) Delete the Lifecycle manager rule
f) Terminate EC2 instance.
g) Delete the 10 Gig Volume





