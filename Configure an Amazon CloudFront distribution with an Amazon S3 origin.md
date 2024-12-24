## Configuring an Amazon CloudFront distribution with an Amazon S3 origin

**Amazon CloudFront** is a web service that provides a cost-effective way to distribute content with low latency and high data transfer speeds. 
CloudFront accelerates static website content delivery, serve video on demand or live streaming video, and even run serverless code at the edge location. 
We'll configure a CloudFront distribution in front of an Amazon S3 bucket and secure it using origin access control (OAC) provided by CloudFront.
**Origin Access Control (OAC)** is a security feature that allows you to restrict access to the Amazon S3 origins to only the specified CloudFront distributions.

1. Created an S3 bucket with default security settings. 
2. Configured an S3 bucket for public access.
3. Added an S3 bucket as a new origin to an existing CloudFront distribution.
4. Secured an S3 bucket to permit access only through the CloudFront distribution.
5. Configured OAC to lock down security to an S3 bucket.
6. Configured Amazon S3 resource policies for public or OAC access.
