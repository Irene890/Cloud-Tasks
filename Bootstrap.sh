#!/bin/bash  
yum update -y
yum install httpd -y
echo "<html><body><h1>Hello Cloud Gurus</h1></body></html>" >/var/www/html/index.html
systemctl start httpd
systemctl enable httpd

----------------------------------------------------------------------------------------------------------------

#!/bin/bash	
dnf update -y
dnf install httpd -y
echo "<html><body><h1>Hello Cloud Gurus</h1></body></html>" >/var/www/html/index.html
systemctl enable httpd
systemctl start httpd
