# Product-wide

Rules that apply to more than one feature.

## Requirements

- P1 Every submission, approval, rejection and export is recorded in an audit log. Applies to: all. *assumed*
- P2 Amounts are in a single company currency, stored in cents. Applies to: F1, F2, F3. *assumed*
- P3 Users sign in through SSO. \[org default\] Applies to: all.

## Decisions

- Payroll export is a generic file with no specific payroll system. 
- One currency only; no multi-currency. *assumed*