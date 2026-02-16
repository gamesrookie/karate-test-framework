
Feature: Order Cancellation

Background:
  * url baseUrl

Scenario: Happy Path
  Given path 'api/v1/orders/ORD-1/cancel'
  And request
  """
  {
    "lineItems": ["ITEM-1"],
    "cancellationReason": "Changed mind",
    "requestedBy": "user@email.com"
  }
  """
  When method post
  Then status 202
  And match response.status == "CANCELLED"
