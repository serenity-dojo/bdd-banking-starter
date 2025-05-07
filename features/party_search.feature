Feature: Search for a party by name or ID
  As a compliance officer
  I want to search for a party by name or ID
  So that I can find the correct party in the system

  Rule: Searches should return the correct parties based on full or partial name

    Example: Search by full name returns an exact match
      Given the following parties exist:
        | Party ID  | Name             | Type         |
        | P12345678 | Acme Corporation | Organization |
        | P87654321 | Axel Accounting  | Organization |
        | P87654329 | Axe Capital      | Organization |
      When Connie searches for "Acme Corporation"
      Then the search results should contain exactly:
        | Party ID  | Name             | Type         |
        | P12345678 | Acme Corporation | Organization |

    Example: Search should be case-insensitive
      Given the following parties exist:
        | Party ID  | Name             | Type         |
        | P12345678 | Acme Corporation | Organization |
      When Connie searches for "acme corporation"
      Then the search results should contain exactly:
        | Party ID  | Name             | Type         |
        | P12345678 | Acme Corporation | Organization |

    Example: Partial name match returns multiple results
      Given the following parties exist:
        | Party ID  | Name             | Type         |
        | P12345678 | Acme Corporation | Organization |
        | P87654321 | Acme Supplies    | Organization |
        | P99999999 | Beta Logistics   | Organization |
      When Connie searches for "Acme"
      Then the search results should contain exactly:
        | Party ID  | Name             | Type         |
        | P12345678 | Acme Corporation | Organization |
        | P87654321 | Acme Supplies    | Organization |
