Feature: Add a New Real-Time Payee Using PayID
  As a retail banking customer,
  I want to add a new person or company to my payee address book
  So that I can instantly transfer funds without needing their bank details

  Rule: Customer must provide either a mobile number, email address, ABN or PayID Organisation Identifier.

    Background:
      Given Nick is a CBA customer with a current account

    Example: The one where Nick enters a valid PayID using a mobile number
      Given Jim is registered with PayID under:
        | PayID      | ID Type | Name      |
        | 0412345678 | Mobile  | Jim Brown |
      When Nick adds Jim as a payee using the PayID "0412345678"
      Then Nick's Payee list should contain:
        | Payee Name | PayID      |
        | Jim Brown  | 0412345678 |

    Example: The one where Nick enters a valid PayID using an email address
      Given Jake is registered with PayID under:
        | PayID          | ID Type | Name      |
        | jake@email.com | Email   | Jake Mail |
      When Nick adds Jake as a payee using the PayID "jake@email.com"
      Then Nick's Payee list should contain:
        | Payee Name | PayID          |
        | Jake Mail  | jake@email.com |

    Example: The one where Oscar enters a valid organisation identifier
      Given Acme Corporation is registered with PayID under:
        | PayID    | ID Type                 | Organisation Name |
        | Pay Acme | Organisation Identifier | Acme Corporation  |
      When Nick adds Acme Corporation as a payee using the PayID "Pay Acme"
      Then Nick's Payee list should contain:
        | Payee Name       | PayID    |
        | Acme Corporation | Pay Acme |

    Scenario Outline: Customer can add an organization as a payee using any of its registered PayID types
      Given Acme Corporation is registered with the following PayIDs:
        | PayID          | ID Type                 |
        | 12 345 678 901 | ABN                     |
        | Pay Acme       | Organisation Identifier |
        | payus@acme.com | Email                   |
      When Nick adds Acme Corporation as a payee using the PayID "<PayID>"
      Then Nick's Payee list should contain:
        | Payee Name       | PayID   |
        | Acme Corporation | <PayID> |

      Examples:
        | PayID          |
        |    12345678901 |
        | Pay Acme       |
        | payus@acme.com |

    Example: The one where Lucia enters an incorrect mobile number
      Given Lucia is registered with PayID under:
        | PayID      | ID Type | Name      |
        | 0412345678 | Mobile  | Lucia Lee |
      When Nick adds Lucia as a payee using the PayID "0412345679"
      Then Nick should see an error message "PayID not found"
      And Nick's Payee list should not be updated

    Example: The one where Josh enters a US mobile number
      Given Josh is registered with PayID under:
        | PayID          | ID Type | Name       |
        | josh@email.com | Mobile  | Josh Smith |
      When Nick adds Josh as a payee using the PayID "+1 1234567890"
      Then Nick should see an error message "Please enter a valid Australian mobile number"
      And Nick's Payee list should not be updated

  Rule: The system must check for duplicate payees and prevent accidental duplicates

    Background:
      Given Nick is a CBA customer with a current account

    Example: The one where Nick tries to add a duplicate PayID
      Given Nick has the following payees:
        | Payee Name | PayID          |
        | Jim Brown  |     0412345678 |
        | Jake Mail  | jake@email.com |
      When Nick tries to add Jim as a payee using the PayID "0412345678"
      Then Nick should see an error message "PayID already exists in your payee list"
      And Nick's Payee list should not be updated

  Rule: Customer should be able to assign an optional nickname to each payee

    Example: The one where Nick adds a payee with a nickname
      Given Jim is registered with PayID under:
        | PayID      | ID Type | Name      |
        | 0412345678 | Mobile  | Jim Brown |
      When Nick adds Jim as a payee using the PayID "0412345678" with the nickname "Jimbo"
      Then Nick should see a confirmation message "Payee added successfully"
      And Nick's Payee list should contain:
        | Payee Name | PayID      | Nickname |
        | Jim Brown  | 0412345678 | Jimbo    |

    Example: The one where Nick adds a nickname to an existing payee
      Given Nick has the following payees:
        | Payee Name | PayID          | Nickname |
        | Jim Brown  |     0412345678 |          |
        | Jake Mail  | jake@email.com |          |
      When Nick adds the nickname "Jimbo" to Jim's payee entry
      Then Nick should see a confirmation message "Payee updated successfully"
      And Nick's Payee list should contain:
        | Payee Name | PayID          | Nickname |
        | Jim Brown  |     0412345678 | Jimbo    |
        | Jake Mail  | jake@email.com |          |

    Example: The one where Nick tries to add a duplicate nickname
      Given Nick has the following payees:
        | Payee Name | PayID          | Nickname |
        | Jim Brown  |     0412345678 | Jimbo    |
        | Jake Mail  | jake@email.com |          |
      And James is registered with PayID under:
        | PayID           | ID Type | Name            |
        | james@email.com | Email   | James The Clone |
      When Nick tries to add James as a payee using the PayID "0412345678" with the nickname "Jimbo"
      Then Nick should see an error message "Nickname already exists for another payee"
      And Nick's Payee list should not be updated

    Scenario Outline: The one where Nick tries to add a payee with an invalid nickname
      Given Jill is registered with PayID under:
        | PayID      | ID Type | Name      |
        | 0412345678 | Mobile  | Jill King |
      When Nick adds Jill as a payee using the PayID "0412345678" with the nickname "<Nickname>"
      Then Nick should see an error message "<Message>"
      And Nick's Payee list should not be updated

      Examples:
        | Nickname       | Message                                    |
        | @jillsnickname | Nickname cannot contain special chars      |
        | nick name      | Nickname cannot contain spaces             |
        |     1234567890 | Nickname cannot be all numbers             |
        | Happy Jill 😀   | Nickname cannot contain special characters |
