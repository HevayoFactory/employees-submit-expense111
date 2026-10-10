# Payroll export

## Purpose

Finance exports approved claims to payroll as a generic file.

Needs: F2.

## User Stories

- F3.1 As a finance user, I see approved claims not yet exported.
- F3.2 As a finance user, I select approved claims, or all not yet exported, and download them as a CSV.
- F3.3 As a finance user, I see which claims were exported, when and by whom. *assumed*

## Decisions

- The export is a CSV file.
- Exported claims are marked as exported and are never exported twice.
- One CSV row per claim, with employee, claim ID, total amount and approval date. *assumed*

## Out of Scope

- Scheduled automatic export.