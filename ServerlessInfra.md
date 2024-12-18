##Proposal:
Customer Care professionals take snapshots of products and upload them into a specific S3 bucket to store the images. 
The development team runs Python scripts to resize the images after they are uploaded to the ingest S3 bucket. 
Uploading a file to the ingest bucket invokes an event notification to an Amazon SNS topic. 
Amazon SNS then distributes the notifications to three separate SQS queues. 
The initial design was to run EC2 instances in Auto Scaling groups for each resizing operation. 
After reviewing the initial design, it's recommended to replace the EC2 instances with Lambda functions. 
The Lambda functions process the stored images into different formats and stores the output in a separate S3 bucket. 
Event-driven architectures are adopted to decouple distributed applications.


###Solution
Using Amazon Simple Notification Service (Amazon SNS) topics and Amazon Simple Queue Service (Amazon SQS) queues, we address cases that require end-to-end message ordering, deduplication, filtering, and encryption.
In this scenario an Amazon Simple Storage Service (Amazon S3) bucket is configured to invoke an Amazon SNS notification whenever an object is added to an S3 bucket. Amazon SNS then distributes the notifications to 2 SQS queues.
We create AWS Lambda functions using preexisting code. The AWS Lambda function is invoked using Amazon SQS. The Lambda functions process the images into formats and stores the output in S3 bucket folder.
This scenario helps one to understand how to architect an application to respond to Amazon S3 bucket events using serverless services such as Amazon SNS, AWS Lambda, and Amazon SQS.
Validation  of the processed images in the S3 bucket folders and the logs in Amazon CloudWatch.
