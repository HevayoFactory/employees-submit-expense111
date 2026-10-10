# Employee expense claims

## Problem Statement

Employees need to be reimbursed for money they spend on the company's behalf, but claims, approvals and the hand-off to payroll are handled by hand, which is slow and error-prone for employees, managers and finance.

## Solution

A system where employees submit expense claims, their managers approve or reject them, and finance exports approved claims to payroll for reimbursement.

## Actors

- Employee: submits expense claims and follows their status.
- Manager: reviews, approves or rejects the claims of their team.
- Finance: exports approved claims to payroll.

## Features

- F1 [Submit expense claims](features/F1-submit-expense-claims.md)
- F2 [Approvals](features/F2-approvals.md)
- F3 [Payroll export](features/F3-payroll-export.md)
- F4 [Notifications](features/F4-notifications.md)

## Product-wide

See [Product-wide](product-wide.md).

## Out of Scope

- Integration with a specific payroll system; the export is a generic file.
- An agent reading receipt images; employees enter claim details themselves.
- Approval by anyone other than the employee's line manager, including deputies and finance approval above a limit.

