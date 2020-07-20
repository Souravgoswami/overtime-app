# Overtime App
Key requirement: company needs documentation that salaried employees did not get overtime each week.

# Models
- Post -> date:date rationale:text
- User -> Devise
- AdminUser -> STI
- Auditing

## Features
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- Administrate admin dashboard
- Block non-admin and guest users
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime

## UI
+ Bootstrap formatting
+ Custom CSS (Sass)
+ Icons from a custom code to generate css based on svg in a dir

## Refractor TODOS:
- Refractor posts/_form for admin user with status
