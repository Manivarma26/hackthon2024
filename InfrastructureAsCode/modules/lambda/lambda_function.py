import json
import os
import requests

def lambda_handler(event, context):
    # Extract data from the IoT event
    data = json.dumps(event)
    
    # Send to Datadog
    datadog_api_key = os.environ['DD_API_KEY']
    url = f"https://http-intake.logs.datadoghq.com/v1/input/{datadog_api_key}"
    
    headers = {
        'Content-Type': 'application/json',
    }
    
    response = requests.post(url, headers=headers, data=data)
    return {
        'statusCode': response.status_code,
        'body': response.text
    }

