# DevOps-Project-Two-Tier-Flask-App-using-AWS

## How to Test Locally (Without Docker)

1. Go to the **app** directory:

```bash
   cd app/
   pip install -r requirements.txt
   http://127.0.0.1:5000
```

## 🏗 High-Level Architecture

Developer
↓
GitHub Repository (DevOps-Project-Two-Tier-Flask-App)
↓
CI/CD Tool (Jenkins / GitHub Actions)
↓
Build & Push Docker Images
↓
Deployment Environment

---

| Web Tier (Flask Container)          |
| ----------------------------------- |
| - Python Flask application          |
| - Communicates with DB via internal |
| network (private subnet / bridge)   |

---

---

| Database Tier (MySQL/Postgres)      |
| ----------------------------------- |
| - Runs as a container or managed DB |
| - Stores application data securely  |

---
