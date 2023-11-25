# Create a Lambda Function Using the AWS Management Console

## Problem Statement
_Alfredo's Pizza is a global fast-food chain selling delicious pizza. Their website serves thousands of customers each day and processes over 6 million in payments each week. 
While Alfredo is doing well, he's not seeing the customers he had hoped for, and relying on expensive, always-on servers ends up with resources sitting idle, wasting money.
Alfredo wants to migrate his application to a serverless architecture with the hope of saving on operating costs._
Help him by showing him how easy Lambda functions can be.

## Come up with a Lambda Function in Python
1) Navigate to Lambda.
2) Click Create function.
3)Select Author from scratch option

      _Function name: Type myfunction.
      Runtime: Select the latest version of Python.
      Select Create a new role with basic Lambda permissions._
4) Click Create function.
5) Under Code source, select lambda_function.py.
6) Enter the below python code- Enters both names:
                  _import json
                  
                  def lambda_handler(event, context):
                      message = 'Hello {} {}! Keep being awesome!'.format(event['first_name'], event['last_name'])  
                      #print to CloudWatch logs
                      print(message)
                  
                      return {
                          'message' : message
                      }  _
7) Deploy.

## Create a Test Event and Execute Lambda
1) Select Test > Configure test event.
2) For Event name, type mytest
3) In the Event JSON box, replace the sample code with the following:
             _ { 
              "first_name": "Irene",
              "last_name": "Ndung'u" 
              }_
4) Click Format JSON, Save and Test.

# Review the execution results that appear.
1) To verify CloudWatch has Captured Function Logs
2) Click the Monitor tab in Lambda window
3) Click View logs in CloudWatch, it opens a new window
4) Under Log streams, click the most recent log stream.
5) Review the log. You should see similar output as you did in the execution results.
