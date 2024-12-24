## Configuring an Amazon CloudFront distribution with an Amazon S3 origin

**Amazon CloudFront** is a web service that provides a cost-effective way to distribute content with low latency and high data transfer speeds. 
CloudFront accelerates static website content delivery, serve video on demand or live streaming video, and even run serverless code at the edge location. 
We'll configure a CloudFront distribution in front of an Amazon S3 bucket and secure it using origin access control (OAC) provided by CloudFront.
A *CloudFront Origin* defines the location of the definitive, original version of the content that is delivered through the CloudFront distribution.
**Origin Access Control (OAC)** is a security feature that allows you to restrict access to the Amazon S3 origins to only the specified CloudFront distributions.

1. Created an S3 bucket with default security settings. 
2. Configured an S3 bucket for public access.
3. Added an S3 bucket as a new origin to an existing CloudFront distribution.
4. Secured an S3 bucket to permit access only through the CloudFront distribution.
5. Configured OAC to lock down security to an S3 bucket.
6. Configured Amazon S3 resource policies for public or OAC access.

**Public Read policy for the bucket**

{
	"Version": "2012-10-17",
	"Id": "Policy1621958846486",
	"Statement": [
		{
			"Sid": "OriginalPublicReadPolicy",
			"Effect": "Allow",
			"Principal": "*",
			"Action": [
				"s3:GetObject",
				"s3:GetObjectVersion"
			],
			"Resource": "arn:aws:s3:::asp-bucket-375462624/*"
		}
	]
}

**Updated the bucket policy to allow read-only access from the CloudFront distribution only**
Objects are now accessible from the Cloud front and not the S3

{
    "Version": "2012-10-17",
    "Statement": {
        "Sid": "AllowCloudFrontServicePrincipalReadOnly",
        "Effect": "Allow",
        "Principal": {
            "Service": "cloudfront.amazonaws.com"
        },
        "Action": [
            "s3:GetObject",
            "s3:GetObjectVersion"
        ],
        "Resource": "arn:aws:s3:::lab-bucket-375462624/*",
        "Condition": {
            "StringEquals": {
                "AWS:SourceArn": "arn:aws:cloudfront::710738049684:distribution/EAUY3HKBWUI2Z"
            }
        }
    }
}


