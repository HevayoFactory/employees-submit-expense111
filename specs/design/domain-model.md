# Domain model

Employees own claims made of expense lines with receipts; managers decide them; finance exports approved ones. Amounts are in cents in one company currency (P2).

```mermaid
erDiagram
    EMPLOYEE ||--o{ CLAIM : submits
    EMPLOYEE ||--o{ EMPLOYEE : manages
    CLAIM ||--|{ EXPENSE_LINE : contains
    EXPENSE_LINE ||--o{ RECEIPT : has
    EXPENSE_LINE }o--|| CATEGORY : categorised_as
    CLAIM ||--o| EXPORT_BATCH : exported_in
    CLAIM ||--o{ AUDIT_ENTRY : logged_by
    EMPLOYEE {
        string id PK
        string name
        string email
        string managerId FK
    }
    CLAIM {
        string id PK
        string employeeId FK
        string status "draft, submitted, approved, rejected, withdrawn"
        int totalCents
        string rejectionReason
        datetime submittedAt
        datetime decidedAt
        string exportBatchId FK
    }
    EXPENSE_LINE {
        string id PK
        string claimId FK
        date expenseDate
        string categoryId FK
        int amountCents
        string description
    }
    RECEIPT {
        string id PK
        string lineId FK
        string fileName
        string contentType
        blob content
    }
    CATEGORY {
        string id PK
        string name
    }
    EXPORT_BATCH {
        string id PK
        string exportedBy
        datetime exportedAt
    }
    AUDIT_ENTRY {
        string id PK
        string claimId FK
        string action
        string actorId
        datetime at
    }
    SETTING {
        string key PK
        int valueCents "receipt threshold"
    }
```

Employee `managerId` defines a manager's team. Receipts are stored in the database for the first version. The receipt threshold is a single setting held in SETTING.