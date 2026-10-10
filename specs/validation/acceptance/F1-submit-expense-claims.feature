Feature: F1 Submit expense claims

  @story-F1.1
  Rule: A claim is made of several expense lines, each with a date, category, amount and description

    Scenario: A claim with two lines
      Given Erin the employee is creating a new claim
      When she adds a "Meals" line of 42.25 dated "12 Sep" described "Client lunch" and a "Travel" line of 18.00 dated "12 Sep" described "Taxi"
      Then the claim shows two lines with a total of 60.25

  @story-F1.2
  Rule: Receipts can be attached to the expense lines of a claim

    Scenario: Attaching a receipt to a line
      Given Erin has a draft claim with a "Meals" line of 42.25
      When she attaches the file "lunch.jpg" to that line
      Then the line shows "lunch.jpg" as its receipt

  @story-F1.3
  Rule: A claim is sent to approval only when the employee submits it

    Scenario: Submitting a draft
      Given Erin has a draft claim with a "Travel" line of 10.00 and no receipt needed
      When she submits the claim
      Then the claim's status is "Submitted"

  @story-F1.4 @story-F1.8
  Rule: A claim with a line above the receipt threshold and no receipt cannot be submitted

    @negative
    Scenario: A line above the threshold without a receipt
      Given Fiona from finance has set the receipt threshold to 25.00
      And Erin has a draft claim with a "Meals" line of 42.25 and no receipt
      When Erin submits the claim
      Then the claim's status is still "Draft"

    Scenario: A line at or below the threshold needs no receipt
      Given Fiona from finance has set the receipt threshold to 25.00
      And Erin has a draft claim with a "Travel" line of 25.00 and no receipt
      When Erin submits the claim
      Then the claim's status is "Submitted"

  @story-F1.8
  Rule: Only finance may set the receipt threshold

    @negative
    Scenario: An employee cannot change the threshold
      Given the receipt threshold is 25.00
      When Erin the employee tries to set the receipt threshold to 500.00
      Then the receipt threshold is still 25.00

  @story-F1.5
  Rule: A submitted claim can be edited or withdrawn only until the manager acts on it

    Scenario: Editing before the manager acts
      Given Erin has submitted a claim with a "Travel" line of 10.00
      When she changes the line's amount to 12.00
      Then the claim total is 12.00

    @negative
    Scenario: Editing after approval
      Given Erin's claim with a "Travel" line of 10.00 has been approved by her manager
      When she tries to change the line's amount to 12.00
      Then the claim total is still 10.00

  @story-F1.6
  Rule: A rejected claim can be fixed and resubmitted

    Scenario: Resubmitting a rejected claim
      Given Erin's claim was rejected with the reason "Receipt unreadable"
      When she attaches a new receipt and submits the claim again
      Then the claim's status is "Submitted"

  @story-F1.7
  Rule: Employees see only their own claims, with status and rejection reason

    Scenario: Seeing the rejection reason
      Given Erin's claim was rejected with the reason "Receipt unreadable"
      When Erin opens her claims
      Then that claim shows the status "Rejected" and the reason "Receipt unreadable"

    @negative
    Scenario: Another employee's claim is not visible
      Given Erin has submitted a claim
      When Eli, another employee, opens his claims
      Then Erin's claim is not listed
