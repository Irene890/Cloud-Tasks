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
5. Configured S3 resource policies for public or OAC access { Origin Access Control (OAC) ensures only CloudFront can access the S3 bucket, preventing direct public access to S3.}
  
Scenario Overview: We will use S3 as the private storage location (the Origin) and CloudFront as the publicly accessible front door (the CDN). We will use an Origin Access Control (OAC) to ensure only CloudFront can access the S3 bucket, preventing direct public access to S3.

Phase 1: Configure the S3 Origin Bucket

This bucket will hold your content but will NOT be publicly accessible.

Step 1: Create the S3 Bucket

Navigate to the S3 service console.

Click Create bucket.

Bucket Name: Choose a unique, globally distinct name (e.g., my-fast-site-2025-lab).

AWS Region: Choose a region close to your primary location (this is your origin).

Object Ownership: Select ACLs disabled (recommended).

Block Public Access settings for this account: LEAVE ALL FOUR CHECKBOXES CHECKED (the default). This is crucial for security—the bucket must remain private.

Click Create bucket.

Step 2: Upload Content

Open your new bucket.

Click Upload.

Upload your website files (at minimum: index.html and error.html).

Step 3: Define Origin Access (OAC/OAI)

We will set up the access policy after creating the CloudFront distribution, as CloudFront will generate the required policy for us.

Phase 2: Configure the CloudFront Distribution

CloudFront is the engine that will fetch your content and serve it to the public via Edge Locations.

Step 4: Create the Distribution

Navigate to the CloudFront service console.

Click Create a CloudFront distribution.

Step 5: Specify Origin Settings

Origin Domain: Click the input field. A list of your S3 buckets will appear. Select the bucket you created in Step 1.

Note: CloudFront automatically uses the S3 REST API endpoint, which is necessary for OAC to work correctly.

Name: (Optional) Give the origin a descriptive name (e.g., s3-website-origin).

Origin Access: Select Origin access control settings (recommended).

Select Create control setting if you don't have one, or choose an existing OAC.

Purpose: OAC prevents users from bypassing CloudFront and accessing your S3 bucket directly.

Step 6: Update the S3 Bucket Policy (Critical Security Step)

After you select/create the OAC, CloudFront will display a message box: "Bucket Policy: The bucket policy will need to be updated..."

Click the blue button that says Copy policy.

Open a new tab and navigate back to your S3 Bucket.

Go to the Permissions tab.

Find Bucket policy and click Edit.

Paste the policy you copied from CloudFront into the policy editor.

Click Save changes.

Your S3 bucket is now locked down so only your specific CloudFront distribution can read files from it.

Step 7: Configure General Distribution Settings

Default cache behavior:

Viewer Protocol Policy: Select Redirect HTTP to HTTPS (Standard security practice).

Settings:

Price class: Select Use only North America and Europe (Recommended for lower cost) or Use all Edge Locations (for maximum global performance).

Alternative Domain Names (CNAMES): Leave blank for now, but this is where you’d add www.example.com.

Default Root Object: Enter index.html. (This is the file CloudFront fetches when a user navigates to the root URL /).

Click Create distribution.

Phase 3: Verification and Testing

Step 8: Test the Distribution

Wait for the CloudFront distribution state to change from Deploying to Deployed (this can take 5–15 minutes).

Copy the Distribution domain name (it looks like d1234abcd.cloudfront.net).

Paste the domain name into a browser.

Expected Result: Your index.html content should load quickly, demonstrating a successful cache hit from an Edge Location.

Step 9: Verify Caching and Security

Open the Developer Tools (F12) in your browser and check the Network tab.

Inspect the HTTP headers for your main file (e.g., index.html).

Look for the X-Cache header:

First Load: It should say Miss from cloudfront.

Second Load: It should say Hit from cloudfront.

Attempt to access the original S3 bucket REST API endpoint directly (you can find this on the S3 properties page).

Expected Result: Direct access to the S3 URL should result in an "Access Denied" error, confirming that your OAC policy is correctly enforcing security.
