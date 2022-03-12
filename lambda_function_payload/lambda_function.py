import json
import boto3


def lambda_handler(event, context):
    client=boto3.resource("dynamodb")
    table = client.Table("EmployeeTable")
    employeeProfile = table.scan() ['Items']
    response = "<h1> List of employeeProfile<ul>%s</ul></h1>" % employeeProfile
    return response