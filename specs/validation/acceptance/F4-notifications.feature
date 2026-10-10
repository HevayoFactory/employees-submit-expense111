Feature: F4 Notifications

  @story-F4.1
  Rule: The manager is emailed when a team member submits a claim

    Scenario: Submission notifies the manager
      Given Dana's manager is Mona
      When Dana submits a claim
      Then Mona receives an email about Dana's claim

  @story-F4.2
  Rule: The employee is emailed when their claim is approved

    Scenario: Approval notifies the employee
      Given Dana has submitted a claim
      When Mona approves it
      Then Dana receives an email saying the claim was approved

  @story-F4.3
  Rule: The employee is emailed when their claim is rejected, with the reason

    Scenario: Rejection notifies the employee with the reason
      Given Dana has submitted a claim
      When Mona rejects it with the reason "Not a business expense"
      Then Dana receives an email saying the claim was rejected with the reason "Not a business expense"

  @story-F4.1
  Rule: Finance is not notified of claim events

    @negative
    Scenario: Finance receives nothing on approval
      Given Dana has submitted a claim
      When Mona approves it
      Then Fiona from finance receives no email about the claim
