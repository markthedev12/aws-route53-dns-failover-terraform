# AWS Route 53 Active-Passive DNS Failover Architecture with Terraform

An Infrastructure-as-Code (IaC) deployment modeling high-availability DNS routing and automated disaster recovery failover using **Amazon Route 53** and **HashiCorp Terraform**.

---

## 📌 Architecture Overview

This project provisions an automated active-passive DNS failover architecture designed to maintain application availability during endpoint degradation:

1. **Public Hosted Zone:** Establishes DNS management for the target domain (`schwinngroup.com`).
2. **Endpoint Health Check:** Configures an external HTTP health probe to continuously monitor primary endpoint status.
3. **Primary Routing Record:** Routes production traffic to the primary infrastructure under normal operating conditions.
4. **Secondary Failover Record:** Automatically intercepts and routes traffic to a disaster recovery endpoint when the primary health check breaches failure thresholds.

Project Screenshots:
<img width="449" height="51" alt="Screenshot 2026-08-27 185944" src="https://github.com/user-attachments/assets/b24fd653-4099-46fd-b577-c358638ee805" />


<img width="372" height="31" alt="Screenshot 2026-08-27 190012" src="https://github.com/user-attachments/assets/9a355cea-f9c5-4025-b29a-d2d4f3deedd3" />


<img width="289" height="80" alt="Screenshot 2026-08-27 190025" src="https://github.com/user-attachments/assets/3845aba3-f16c-4cd6-af2a-e25ee81d66dd" />
