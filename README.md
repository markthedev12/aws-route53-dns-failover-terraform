# AWS Route 53 Active-Passive DNS Failover Architecture with Terraform

An Infrastructure-as-Code deployment modeling high-availability DNS routing and automated disaster recovery failover using **Amazon Route 53** and **HashiCorp Terraform**.

---

## 📌 Architecture Overview

This project provisions an automated active-passive DNS failover architecture designed to maintain application availability during endpoint degradation:

1. **Public Hosted Zone:** Establishes DNS management for the target domain (`schwinngroup.com`).
2. **Endpoint Health Check:** External HTTP health probe continuously monitoring primary endpoint status.
3. **Primary Routing Record:** Routes production traffic to the primary infrastructure under normal operating conditions.
4. **Secondary Failover Record:** Automatically routes traffic to a disaster recovery endpoint when the primary health check breaches failure thresholds.

---
## Project Screenshots
<img width="289" height="80" alt="Screenshot 2026-08-27 190025" src="https://github.com/user-attachments/assets/d72454c0-be12-41de-917c-410dbcd0f20e" />

<img width="372" height="31" alt="Screenshot 2026-08-27 190012" src="https://github.com/user-attachments/assets/b8e57f0d-daac-425c-8c61-946a139b188c" />

<img width="449" height="51" alt="Screenshot 2026-08-27 185944" src="https://github.com/user-attachments/assets/3920bd70-fdfa-43eb-abe9-04e66c1f254b" />



## 📂 Project Structure

```text
aws-route53-dns-failover-terraform/
├── main.tf        # Route 53 zone, health check, and failover record definitions
├── variables.tf   # Parameterized region and domain variables
├── outputs.tf     # Exported Name Servers and Health Check IDs
