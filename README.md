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

## 📂 Project Structure

```text
aws-route53-dns-failover-terraform/
├── main.tf        # Route 53 zone, health check, and failover record definitions
├── variables.tf   # Parameterized region and domain variables
├── outputs.tf     # Exported Name Servers and Health Check IDs
└── screenshots/   # Verification proof
