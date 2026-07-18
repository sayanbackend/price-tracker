import json
from function import handler


def test_handler_returns_200():
    response = handler({}, {})
    assert response["statusCode"] == 200


def test_handler_returns_valid_json_body():
    response = handler({}, {})
    body = json.loads(response["body"])
    assert "message" in body


def test_handler_message_content():
    response = handler({}, {})
    body = json.loads(response["body"])
    assert body["message"] == "price-tracker placeholder executed successfully"


def test_handler_accepts_arbitrary_event():
    response = handler({"some": "data"}, {})
    assert response["statusCode"] == 200