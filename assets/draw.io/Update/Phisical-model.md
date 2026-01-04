# Commited - Physical Data Model (Oracle DB)

## USER
| Column | Type | Constraints | Default | Description |
|--------|------|-------------|---------|-------------|
| user_id | RAW(16) | PK, NOT NULL | SYS_GUID() | UUID primary key |
| email | VARCHAR2(255) | UNIQUE, NOT NULL | - | User email address |
| full_name | VARCHAR2(255) | NOT NULL | - | Full name |
| password_hash | VARCHAR2(255) | NOT NULL | - | Bcrypt hashed password |
| system_role | VARCHAR2(20) | NOT NULL, CHECK | 'user' | System role: user, admin |
| is_active | NUMBER(1) | NOT NULL | 1 | Active status (1=true, 0=false) |
| created_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Last update timestamp |

**Constraints:**
- `CHECK (system_role IN ('user', 'admin'))`
- `CHECK (is_active IN (0, 1))`

---

## COURSE
| Column | Type | Constraints | Default | Description |
|--------|------|-------------|---------|-------------|
| course_id | RAW(16) | PK, NOT NULL | SYS_GUID() | UUID primary key |
| course_name | VARCHAR2(255) | NOT NULL | - | Course name |
| course_code | VARCHAR2(50) | UNIQUE, NOT NULL | - | Unique course code |
| section | VARCHAR2(50) | - | - | Course section |
| description | CLOB | - | - | Course description |
| subject | VARCHAR2(100) | - | - | Subject area |
| is_open | NUMBER(1) | NOT NULL | 1 | Open for enrollment (1=true, 0=false) |
| is_active | NUMBER(1) | NOT NULL | 1 | Active status (1=true, 0=false) |
| teacher_id | RAW(16) | FK | - | Reference to USER (teacher) |
| created_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Last update timestamp |

**Foreign Keys:**
- `teacher_id REFERENCES USER(user_id) ON DELETE SET NULL`

**Constraints:**
- `CHECK (is_open IN (0, 1))`
- `CHECK (is_active IN (0, 1))`

---

## ENROLLMENT
| Column | Type | Constraints | Default | Description |
|--------|------|-------------|---------|-------------|
| user_id | RAW(16) | PK, FK, NOT NULL | - | Reference to USER |
| course_id | RAW(16) | PK, FK, NOT NULL | - | Reference to COURSE |
| course_role | VARCHAR2(20) | NOT NULL | 'student' | Role in course |
| performance_category | VARCHAR2(20) | - | - | Student performance classification |
| enrolled_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Enrollment timestamp |

**Primary Key:** `(user_id, course_id)`

**Foreign Keys:**
- `user_id REFERENCES USER(user_id) ON DELETE CASCADE`
- `course_id REFERENCES COURSE(course_id) ON DELETE CASCADE`

**Constraints:**
- `CHECK (course_role IN ('student', 'professor', 'ta'))`
- `CHECK (performance_category IN ('excellent', 'good', 'average', 'needs_help') OR performance_category IS NULL)`

---

## ANNOUNCEMENT
| Column | Type | Constraints | Default | Description |
|--------|------|-------------|---------|-------------|
| announcement_id | RAW(16) | PK, NOT NULL | SYS_GUID() | UUID primary key |
| course_id | RAW(16) | FK, NOT NULL | - | Reference to COURSE |
| posted_by | RAW(16) | FK, NOT NULL | - | Reference to USER (author) |
| title | VARCHAR2(255) | NOT NULL | - | Announcement title |
| content | CLOB | - | - | Announcement content |
| posted_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Posted timestamp |
| updated_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Last update timestamp |

**Foreign Keys:**
- `course_id REFERENCES COURSE(course_id) ON DELETE CASCADE`
- `posted_by REFERENCES USER(user_id) ON DELETE CASCADE`

---

## COMMENT
| Column | Type | Constraints | Default | Description |
|--------|------|-------------|---------|-------------|
| comment_id | RAW(16) | PK, NOT NULL | SYS_GUID() | UUID primary key |
| announcement_id | RAW(16) | FK, NOT NULL | - | Reference to ANNOUNCEMENT |
| user_id | RAW(16) | FK, NOT NULL | - | Reference to USER (author) |
| parent_comment_id | RAW(16) | FK | NULL | Reference to parent COMMENT (for replies) |
| content | CLOB | NOT NULL | - | Comment content |
| created_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Last update timestamp |

**Foreign Keys:**
- `announcement_id REFERENCES ANNOUNCEMENT(announcement_id) ON DELETE CASCADE`
- `user_id REFERENCES USER(user_id) ON DELETE CASCADE`
- `parent_comment_id REFERENCES COMMENT(comment_id) ON DELETE CASCADE`

**Constraints:**
- `CHECK (LENGTH(TRIM(content)) > 0)`

---

## ASSIGNMENT
| Column | Type | Constraints | Default | Description |
|--------|------|-------------|---------|-------------|
| assignment_id | RAW(16) | PK, NOT NULL | SYS_GUID() | UUID primary key |
| course_id | RAW(16) | FK, NOT NULL | - | Reference to COURSE |
| created_by | RAW(16) | FK, NOT NULL | - | Reference to USER (creator) |
| title | VARCHAR2(255) | NOT NULL | - | Assignment title |
| description | CLOB | - | - | Assignment description |
| max_points | NUMBER(10) | NOT NULL | 100 | Maximum points |
| due_date | TIMESTAMP | NOT NULL | - | Due date |
| allow_late_submission | NUMBER(1) | NOT NULL | 0 | Allow late submissions (1=true, 0=false) |
| require_github_repo | NUMBER(1) | NOT NULL | 0 | Require GitHub repo (1=true, 0=false) |
| created_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Last update timestamp |

**Foreign Keys:**
- `course_id REFERENCES COURSE(course_id) ON DELETE CASCADE`
- `created_by REFERENCES USER(user_id) ON DELETE CASCADE`

**Constraints:**
- `CHECK (max_points > 0)`
- `CHECK (allow_late_submission IN (0, 1))`
- `CHECK (require_github_repo IN (0, 1))`

---

## SUBMISSION
| Column | Type | Constraints | Default | Description |
|--------|------|-------------|---------|-------------|
| submission_id | RAW(16) | PK, NOT NULL | SYS_GUID() | UUID primary key |
| assignment_id | RAW(16) | FK, NOT NULL | - | Reference to ASSIGNMENT |
| student_id | RAW(16) | FK, NOT NULL | - | Reference to USER (student) |
| submission_text | CLOB | - | - | Submission text content |
| github_repo_url | VARCHAR2(500) | - | - | GitHub repository URL |
| status | VARCHAR2(20) | NOT NULL | 'draft' | Submission status |
| submitted_at | TIMESTAMP | - | - | Submission timestamp |
| updated_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Last update timestamp |

**Foreign Keys:**
- `assignment_id REFERENCES ASSIGNMENT(assignment_id) ON DELETE CASCADE`
- `student_id REFERENCES USER(user_id) ON DELETE CASCADE`

**Constraints:**
- `CHECK (status IN ('draft', 'submitted', 'graded'))`
- `UNIQUE (assignment_id, student_id)` - One submission per student per assignment

---

## GRADE
| Column | Type | Constraints | Default | Description |
|--------|------|-------------|---------|-------------|
| grade_id | RAW(16) | PK, NOT NULL | SYS_GUID() | UUID primary key |
| submission_id | RAW(16) | FK, UNIQUE, NOT NULL | - | Reference to SUBMISSION |
| graded_by | RAW(16) | FK | NULL | Reference to USER (grader), NULL for AI |
| points_earned | NUMBER(10) | NOT NULL | - | Points earned |
| max_points | NUMBER(10) | NOT NULL | - | Maximum points possible |
| feedback | CLOB | - | - | Grading feedback |
| graded_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Grading timestamp |

**Foreign Keys:**
- `submission_id REFERENCES SUBMISSION(submission_id) ON DELETE CASCADE`
- `graded_by REFERENCES USER(user_id) ON DELETE SET NULL`

**Constraints:**
- `CHECK (points_earned >= 0)`
- `CHECK (max_points > 0)`
- `CHECK (points_earned <= max_points)`

---

## CODE_ANALYSIS
| Column | Type | Constraints | Default | Description |
|--------|------|-------------|---------|-------------|
| analysis_id | RAW(16) | PK, NOT NULL | SYS_GUID() | UUID primary key |
| submission_id | RAW(16) | FK, UNIQUE, NOT NULL | - | Reference to SUBMISSION |
| status | VARCHAR2(20) | NOT NULL | 'pending' | Analysis status |
| metrics_data | CLOB | - | - | JSON metrics data |
| report_pdf_url | VARCHAR2(500) | - | - | PDF report URL |
| error_message | CLOB | - | - | Error message if failed |
| analyzed_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Analysis timestamp |

**Foreign Keys:**
- `submission_id REFERENCES SUBMISSION(submission_id) ON DELETE CASCADE`

**Constraints:**
- `CHECK (status IN ('pending', 'analyzing', 'completed', 'failed'))`

---

## ATTACHMENT
| Column | Type | Constraints | Default | Description |
|--------|------|-------------|---------|-------------|
| attachment_id | RAW(16) | PK, NOT NULL | SYS_GUID() | UUID primary key |
| file_name | VARCHAR2(255) | NOT NULL | - | Original filename |
| file_path | VARCHAR2(500) | NOT NULL | - | Storage path |
| file_type | VARCHAR2(50) | - | - | MIME type |
| file_size | NUMBER(20) | - | - | File size in bytes |
| attached_to_type | VARCHAR2(20) | NOT NULL | - | Entity type (polymorphic) |
| attached_to_id | RAW(16) | NOT NULL | - | Entity ID (polymorphic) |
| uploaded_at | TIMESTAMP | NOT NULL | SYSTIMESTAMP | Upload timestamp |

**Constraints:**
- `CHECK (attached_to_type IN ('submission', 'assignment', 'announcement'))`

**Composite Index:**
- `(attached_to_type, attached_to_id)` for polymorphic queries

---

## Data Type Summary

| Type | Oracle Type | Usage |
|------|-------------|-------|
| UUID | RAW(16) | Primary/Foreign keys |
| Short String | VARCHAR2(50-255) | Names, codes, URLs |
| Long Text | CLOB | Content, descriptions |
| Boolean | NUMBER(1) | Flags (0=false, 1=true) |
| Integer | NUMBER(10) | Counts, points |
| Large Integer | NUMBER(20) | File sizes |
| Timestamp | TIMESTAMP | Dates and times |
| JSON | CLOB | Flexible data storage |

---

## Naming Conventions

- **Tables**: UPPERCASE, singular (USER, COURSE)
- **Columns**: lowercase_with_underscores
- **Primary Keys**: `{table}_id` (RAW(16))
- **Foreign Keys**: `{referenced_table}_id` or descriptive name
- **Booleans**: `is_active`, `allow_late_submission` (NUMBER(1), 0 or 1)
- **Timestamps**: `created_at`, `updated_at`, `{action}_at`
- **Enums**: VARCHAR2 with CHECK constraints

---

## Index Strategy

**Primary Keys:** Automatically indexed by Oracle

**Foreign Keys:** Should be indexed for join performance
- user_id in ENROLLMENT, ANNOUNCEMENT, COMMENT, etc.
- course_id in ENROLLMENT, ANNOUNCEMENT, ASSIGNMENT
- announcement_id in COMMENT
- assignment_id in SUBMISSION
- parent_comment_id in COMMENT

**Unique Constraints:** Automatically indexed
- email in USER
- course_code in COURSE
- (assignment_id, student_id) in SUBMISSION

**Performance Indexes:**
- (attached_to_type, attached_to_id) in ATTACHMENT