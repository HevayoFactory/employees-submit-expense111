Feature: F3 Payroll export

  @story-F3.1
  Rule: Finance sees approved claims that have not been exported

    Scenario: Listing unexported approved claims
      Given Dana's claim is approved and Sam's claim is submitted but not approved
      When Fiona from finance opens the approved claims
      Then Dana's claim is listed and Sam's claim is not

  @story-F3.2
  Rule: Finance downloads selected approved claims, or all not yet exported, as a CSV

    Scenario: Exporting one selected claim
      Given two approved claims exist for Dana and Sam
      When Fiona exports only Dana's claim
      Then the downloaded CSV has exactly one row, for Dana's claim

    @negative
    Scenario: A claim that is not approved cannot be exported
      Given Sam's claim is submitted but not approved
      When Fiona tries to export Sam's claim
      Then no CSV row is produced for Sam's claim

  @story-F3.2
  Rule: Only finance may export

    @negative
    Scenario: A manager cannot export
      Given an approved claim exists
      When Mona the manager tries to export it
      Then the claim is still not marked as exported

  @story-F3.2
  Rule: An exported claim is never exported twice

    @negative
    Scenario: Exporting everything a second time
      Given Fiona has exported all approved claims
      When she exports all not yet exported claims again
      Then the second CSV has no rows

  @story-F3.3
  Rule: Finance sees which claims were exported, when and by whom

    Scenario: Export history
      Given Fiona exported Dana's claim
      When she opens the export history
      Then the history shows Dana's claim with Fiona as the exporter and the export time
