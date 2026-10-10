screen MyClaims "An employee's claims and their status"
  navbar "Expenses"
  sidebar "My claims -> MyClaims | Sign out"
  row
    heading "My claims"
    right
    button "New claim" primary -> ClaimForm
  row
    select "Status: All"
  table "Submitted | Total | Status | Reason" -> ClaimDetail
    row "12 Sep | 84.50 | Rejected | Receipt unreadable"
    row "03 Sep | 120.00 | Approved | "
    row "28 Aug | 45.00 | Submitted | "

screen ClaimForm "Create or edit a claim and its expense lines"
  navbar "Expenses"
  sidebar "My claims -> MyClaims | Sign out"
  heading "Claim"
  table "Date | Category | Amount | Description | Receipt"
    row "12 Sep | Meals | 42.25 | Client lunch | lunch.jpg"
    row "12 Sep | Travel | 42.25 | Taxi | missing"
  row
    input "Date"
    select "Category"
    input "Amount"
    input "Description"
  row
    button "Add line"
    button "Attach receipt"
  text "Lines above the receipt threshold need a receipt" muted
  row
    right
    button "Save draft"
    button "Submit claim" primary -> MyClaims

screen ClaimDetail "One claim with status and rejection reason"
  navbar "Expenses"
  sidebar "My claims -> MyClaims | Sign out"
  row
    heading "Claim 12 Sep"
    right
    badge "Rejected" danger
  text "Reason: Receipt unreadable"
  table "Date | Category | Amount | Receipt"
    row "12 Sep | Meals | 42.25 | lunch.jpg"
  row
    right
    button "Withdraw"
    button "Edit and resubmit" primary -> ClaimForm

screen TeamQueue "A manager's pending team claims, oldest first"
  navbar "Expenses"
  sidebar "Team claims -> TeamQueue | Sign out"
  heading "Pending team claims"
  table "Employee | Submitted | Total" -> TeamClaimReview
    row "Dana Lee | 28 Aug | 45.00"
    row "Sam Ortiz | 03 Sep | 120.00"

screen TeamClaimReview "A manager reviews one claim, then approves or rejects"
  navbar "Expenses"
  sidebar "Team claims -> TeamQueue | Sign out"
  heading "Claim by Dana Lee"
  table "Date | Category | Amount | Description | Receipt"
    row "28 Aug | Meals | 45.00 | Team lunch | receipt.pdf"
  textarea "Reason (required to reject)"
  row
    right
    button "Reject" danger -> TeamQueue
    button "Approve" primary -> TeamQueue

screen ApprovedClaims "Finance selects approved claims to export"
  navbar "Expenses"
  sidebar "Approved claims -> ApprovedClaims | Export history -> ExportHistory | Settings -> FinanceSettings | Employees -> EmployeeManagers | Sign out"
  row
    heading "Approved, not yet exported"
    right
    button "Export all" 
    button "Export selected" primary -> ExportHistory
  table "Select | Employee | Total | Approved"
    row "[x] | Dana Lee | 45.00 | 30 Aug"
    row "[ ] | Sam Ortiz | 120.00 | 05 Sep"

screen ExportHistory "Which claims were exported, when and by whom"
  navbar "Expenses"
  sidebar "Approved claims -> ApprovedClaims | Export history -> ExportHistory | Settings -> FinanceSettings | Employees -> EmployeeManagers | Sign out"
  heading "Export history"
  table "Exported | By | Claims"
    row "07 Sep 10:12 | Priya Nair | 12"
    row "31 Aug 09:40 | Priya Nair | 8"

screen FinanceSettings "Receipt threshold and expense categories"
  navbar "Expenses"
  sidebar "Approved claims -> ApprovedClaims | Export history -> ExportHistory | Settings -> FinanceSettings | Employees -> EmployeeManagers | Sign out"
  heading "Settings"
  row
    input "Receipt required above (amount)"
    button "Save threshold" // saves in place
  divider
  heading "Categories"
  list "Meals | Travel | Lodging"
  row
    input "New category"
    button "Add category" // adds in place

screen EmployeeManagers "Finance sets each employee's line manager"
  navbar "Expenses"
  sidebar "Approved claims -> ApprovedClaims | Export history -> ExportHistory | Settings -> FinanceSettings | Employees -> EmployeeManagers | Sign out"
  heading "Employees and line managers"
  table "Employee | Manager"
    row "Dana Lee | Alex Kim"
    row "Sam Ortiz | Alex Kim"
  row
    select "Manager"
    button "Set manager" // saves in place

flow "My claims"
  role "Employee"
  description "An employee creates, submits and follows claims"
  MyClaims
  ClaimForm
  ClaimDetail

flow "Team approvals"
  role "Manager"
  description "A manager reviews and decides team claims"
  TeamQueue
  TeamClaimReview

flow "Payroll export"
  role "FinanceExporter"
  description "Finance exports approved claims and reviews past exports"
  ApprovedClaims
  ExportHistory

flow "Finance setup"
  role "FinanceExporter"
  description "Finance maintains the receipt threshold, categories and reporting lines"
  FinanceSettings
  EmployeeManagers
