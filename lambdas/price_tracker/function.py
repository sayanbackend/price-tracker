import json


def handler(event, context):
    """
    Placeholder handler for price-tracker Lambda.
    Replace with actual scraping logic once the pipeline is verified end-to-end.
    """
    print("price-tracker Lambda invoked")
    print(f"Event received: {json.dumps(event)}")

    return {
        "statusCode": 200,
        "body": json.dumps({"message": "price-tracker placeholder executed successfully"})
    }