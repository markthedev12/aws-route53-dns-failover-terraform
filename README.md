---

## 🚀 Execution & Verification

### 1. Configuration & Project Structure
Defined declarative Terraform infrastructure modules across `main.tf`, `variables.tf`, and `outputs.tf`:

<div align="center">
  
<img width="289" height="80" alt="Screenshot 2026-08-27 190025" src="https://github.com/user-attachments/assets/4698b07f-c587-47a4-b3c3-d2fc3b8d909f" />

  
</div>

---

### 2. Syntax & Argument Validation
Validated provider schemas, required arguments, and variable interpolation:

<div align="center">
  
<img width="449" height="51" alt="Screenshot 2026-08-27 185944" src="https://github.com/user-attachments/assets/786ed193-42a2-4c16-8e5a-92b9b6f9b35c" />

  
</div>

---

### 3. Terraform Plan Output
Confirmed the dry-run execution plan to provision the 4 core DNS and health check resources:

<img width="372" height="31" alt="Screenshot 2026-08-27 190012" src="https://github.com/user-attachments/assets/5fe23a98-02ce-4ec1-b56d-fcfd33bd6da2" />

  

## 🛠️ Deployment Steps

```powershell
# Initialize Terraform and download AWS provider plugins
terraform init

# Validate configuration syntax
terraform validate

# Review execution plan
terraform plan

# Apply infrastructure (optional for live deployment)
terraform apply -auto-approve

# Clean up resources
terraform destroy -auto-approve
