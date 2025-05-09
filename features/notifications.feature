Feature: Manage PayID notification preferences
  As a banking customer,
  I want to choose how I'm notified when I receive a PayID payment,
  So that I can stay informed in a way that suits me.

  Background:
    Given Connie has a registered PayID of "connie@example.com"

  Rule: Customers can receive notifications via one or more preferred channels

    Scenario: Receive a notification via SMS
      Given Connie has a registered PayID of "connie@example.com"
      And Connie has selected the following notification preferences:
        | Method |
        | SMS    |
      When Connie receives a payment via PayID:
        | From      | Amount  |
        | Sarah Lim | $150.00 |
      Then Connie should be notified with:
        | Method | Message                                                                  |
        | SMS    | You've received $150.00 from Sarah Lim to your PayID connie@example.com. |

    Example: Change notification preference to receive push instead of SMS
      Given Connie has selected the following notification preferences:
        | Method |
        | SMS    |
      And she updates her preferences to:
        | Method |
        | Push   |
      When Connie receives a payment via PayID:
        | From        | Amount |
        | James Brown | $75.25 |
      Then Connie should be notified with:
        | Method | Message                                                                     |
        | Push   | Payment received: $75.25 from James Brown to your PayID connie@example.com. |

    Example: Receive notifications through multiple channels
      Given Connie has selected the following notification preferences:
        | Method |
        | Email  |
        | SMS    |
      When Connie receives a payment via PayID:
        | From      | Amount  |
        | Maya Chen | $220.00 |
      Then Connie should be notified with:
        | Method | Message                                                                                 |
        | Email  | You've received a payment of $220.00 from Maya Chen to your PayID (connie@example.com). |
        | SMS    | You've received $220.00 from Maya Chen to your PayID connie@example.com.                |
