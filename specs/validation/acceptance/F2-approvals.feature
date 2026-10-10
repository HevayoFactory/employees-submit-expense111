Feature: F2 Approvals

  @story-F2.1
  Rule: A manager sees their team's pending claims in one list, oldest first

    Scenario: Oldest first
      Given Mona the manager's team member Dana submitted a claim on "28 Aug" and Sam submitted one on "03 Sep"
      When Mona opens her pending claims
      Then Dana's claim is listed before Sam's

    @negative
    Scenario: Another manager's team is not shown
      Given a member of another manager's team has submitted a claim
      When Mona opens her pending claims
      Then that claim is not listed

  @story-F2.2
  Rule: A manager can open a team claim to see its lines and receipts

    Scenario: Opening a claim
      Given Dana submitted a claim with a "Meals" line of 45.00 and the receipt "receipt.pdf"
      When Mona opens the claim
      Then she sees the "Meals" line of 45.00 and the receipt "receipt.pdf"

  @story-F2.3
  Rule: Only the submitting employee's line manager may approve a claim

    Scenario: The line manager approves
      Given Dana has submitted a claim
      When Mona, Dana's manager, approves it
      Then the claim's status is "Approved"

    @negative
    Scenario: Another manager cannot approve
      Given Dana has submitted a claim
      When Max, who manages a different team, tries to approve it
      Then the claim's status is still "Submitted"

  @story-F2.4
  Rule: A rejection requires a reason

    Scenario: Rejecting with a reason
      Given Dana has submitted a claim
      When Mona rejects it with the reason "Not a business expense"
      Then the claim's status is "Rejected" with the reason "Not a business expense"

    @negative
    Scenario: Rejecting without a reason
      Given Dana has submitted a claim
      When Mona tries to reject it without a reason
      Then the claim's status is still "Submitted"
