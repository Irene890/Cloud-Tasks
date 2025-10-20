## Launching VM & Hosting Website
- Instance has a Linux OS
- Instance launched with most recent patches

1) **Name & Tags**
- Label you can assign to an AWS resource
- Consists of Key and Value
- Benefits: Filtering, cost allocation

2)**Choose an AMI**
- Template that consists of O/S (Linux), Applications, Launch permissions
- Choose an AMI according to the use of the instance. is it a web server?
- You can't change an AMI after creation

3) **Instance Type**
- Specifies the hardware used. i.e) CPU, RAM(memory), disk space, Network performance

Instance categories: 
a) General- t2, t3
b) Compute optimized- high performance processors (c4,c5)
c) Memory optimized (R4, R5)
--can be changed after launcing the instance
--Option of vertical scaling (Scale up or down for CPU)

4) **Key pair** - Security credentials you used to prove your identity when connecting to the AWs resource
- Consists of Public key that AWS stores.
- Private key that you store
- Can't be added after launch
Linux instance- SSH

5)Configured the Network Settings
- VPC
- Subnet
- Security Group to place the instance

6) Security Group (stateful)--instance level
- Virtual firewall for the instances
- Specifies allow rules but not deny rules

### Use the VM to host the website.
**Use EC2 Instance connect to connect to the EC2 instance:**
- sudo su -> Root admin
-  yum update -y --> Update the system
- yum install -y httpd ->instal Apache service- downloads all packages- web server
- systemctl status httpd - show https status
- mkdir temp --> Create Directory
- cd temp/
- Copy the link of the free website and use it the wget command below
- wget https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip -->((Download website)To access free websites)
- Website will be copied in the temp/ directory
- ls -lrt (oxer.zip)
- unzip oxer.zip (unzip file)
- cd oxer directory
- mv * /var/www/html/ -  Convert server into web server
- cd /var/www/html/
- ls -lrt
- Check SG, enable http/https port 80/443
- Use public IP to access website
- systemctl enable httpd - enable httpd
- system start httpd - httpd server is now up and website accessible 
