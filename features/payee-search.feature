Feature: Payee Search
  As a retail banking customer,
  I want to search for a payee in my address book
  So that I can quickly find and select the payee I want to transfer funds to

  Background:
    Given Nick is a CBA customer with a current account

  Rule: Customer should be able to search their existing payee list by name or nickname

    Example: Nick searches for a payee using their full name
      Given Nick has the following payees:
        | Payee Name    | PayID                   |
        | Jim Brown     |              0412345678 |
        | Olivia Jacobs | olivia.jacobs@email.com |
      When Nick searches for "Jim Brown"
      Then the system should return:
        | Payee Name | PayID      |
        | Jim Brown  | 0412345678 |

    Example: Nick searches for a payee using a nickname
      Given Nick has the following payees:
        | Payee Name    | PayID         | Nickname |
        | Jim Brown     |    0412345678 | Jimbo    |
        | Olivia Jacobs | liv@email.com | Liv      |
      When Nick searches for "Jimbo"
      Then the system should return:
        | Payee Name | PayID      |
        | Jim Brown  | 0412345678 |

    Example: Nick searches using a partial string that matches multiple payees
      Given Nick has the following payees:
        | Payee Name     | PayID      |
        | Liam Parker    | 0499888777 |
        | William Jacobs | 0400111222 |
        | Olivia Jacobs  | 0422223333 |
      When Nick searches for "Jacobs"
      Then the system should return:
        | Payee Name     | PayID      |
        | William Jacobs | 0400111222 |
        | Olivia Jacobs  | 0422223333 |

    Example: Nick searches with a case-insensitive string
      Given Nick has the following payees:
        | Payee Name  | PayID      |
        | Liam Parker | 0499888777 |
      When Nick searches for "liAm"
      Then the system should return:
        | Payee Name  | PayID      |
        | Liam Parker | 0499888777 |

    Example: Nick searches for a name that doesn’t match any payee
      Given Nick has the following payees:
        | Payee Name    | PayID      |
        | Jim Brown     | 0412345678 |
        | Olivia Jacobs | 0422333444 |
      When Nick searches for "Zelda"
      Then the system should display "No results found"
      And no payees should be returned
