# Submit expense claims

## Purpose

Employees create and submit expense claims and follow their status.

## User Stories

- F1.1 As an employee, I create a claim made of several expense lines, each with a date, category, amount and description.
- F1.2 As an employee, I attach receipts to the expense lines of a claim.
- F1.3 As an employee, I submit a claim for approval.
- F1.4 As an employee, I cannot submit a claim whose lines above the receipt threshold lack a receipt.
- F1.5 As an employee, I edit or withdraw a submitted claim until my manager acts on it.
- F1.6 As an employee, I fix a rejected claim and resubmit it.
- F1.7 As an employee, I see my claims and each one's status, and the rejection reason where there is one.
- F1.8 As a finance user, I set the amount above which a receipt is required.

## Decisions

- A claim holds several expense lines plus receipt attachments.
- Receipts are required above a threshold amount set by finance.
- A claim is editable or withdrawable only until a manager approves or rejects it.
- A rejected claim can be corrected and resubmitted.
- Expense categories are a fixed list maintained by finance.

## Open Questions

1. What is the receipt threshold's initial value?

