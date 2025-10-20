# Configuring Static Website With S3 And CloudFront
1) Configured static website hosting on Amazon S3
2) Configured static websites to work with CloudFront distributions

### Description
- We will host the static website using the Amazon Simple Storage Service (S3) so that it is secure, fast, protected against data loss, and can scale to support enterprise-level traffic.
- We will also use S3 to deliver the website content to visitors
- We will use Amazon CloudFront to create a content delivery network (CDN).
- A CDN makes the website content available from data centers around the world, called edge locations.
- Edge locations improves the speed of your website by reducing latencies
- **AWS Edge Locations** are small, highly distributed data centers established in major metropolitan areas and network hubs around the world. They are strategically placed much **closer to end-users**.

## Objectives
1. Created an S3 bucket with default security settings
2. Configured S3 bucket for public access
3. Add an S3 bucket as new origin to the CloudFront distribution
4. Configured Origin Access Control(OAC) to lock down security to an S3 bucket
5. Configured S3 resource policies for public or OAC access
  
