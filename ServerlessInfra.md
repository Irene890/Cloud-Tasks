## Proposal
Customer Care professionals take snapshots of products and upload them into a specific S3 bucket to store the images. 
The development team runs Python scripts to resize the images after they are uploaded to the ingest S3 bucket. 
Uploading a file to the ingest bucket invokes an event notification to an Amazon SNS topic. 
Amazon SNS then distributes the notifications to three separate SQS queues. 
The initial design was to run EC2 instances in Auto Scaling groups for each resizing operation. 
After reviewing the initial design, it's recommended to replace the EC2 instances with Lambda functions. 
The Lambda functions process the stored images into different formats and stores the output in a separate S3 bucket. 
Event-driven architectures are adopted to decouple distributed applications.


### Solution
Using Amazon Simple Notification Service (Amazon SNS) topics and Amazon Simple Queue Service (Amazon SQS) queues, we address cases that require end-to-end message ordering, deduplication, filtering, and encryption.
In this scenario an Amazon Simple Storage Service (Amazon S3) bucket is configured to invoke an Amazon SNS notification whenever an object is added to an S3 bucket. 
Created an SNS topic
Created 2 Amazon SQS queues each for a specific purpose and then subscribed the queues to the created Amazon SNS topic.
Amazon SNS then distributes the notifications to the 2 SQS queues.
Configured the Amazon SNS access policy (Preexisting) to allow the Amazon S3 bucket to publish to a topic.
Created a single S3 event notification on uploads to the ingest S3 bucket.
Created AWS Lambda functions using preexisting code. The AWS Lambda function is invoked using Amazon SQS. Added the SQS triggers. 
The Lambda functions process the images into formats and stores the output in S3 bucket folder.

**Workflow**
![Image](https://github.com/Irene890/Images/blob/main/Serveless.design.png)

**Resized images**
![Image](https://github.com/Irene890/Images/blob/main/s3validator.png).

