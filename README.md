# Route 53 DNS Failover Lab

Terraform configures active/passive DNS routing for **existing endpoints**. It
creates a hosted zone, a primary HTTP health check, and paired failover A records.
It does not provision web servers, replicate data, or guarantee recovery time.

## Architecture

`Route 53 health checker -> primary IPv4:80/health`

`app.<domain> -> healthy primary A record / standby secondary A record`

The health check targets the primary IP directly so DNS failover cannot cause it
to test the standby accidentally. This assumes an HTTP endpoint that responds to
IP-based requests on `/health`; virtual-host-only or HTTPS-only applications
need a different health-check configuration. The secondary has no health check.

## Configure and validate

Requires Terraform >=1.5, AWS provisioning credentials, a domain you control,
and two independently reachable public IPv4 services. Hosted zones and health
checks incur charges. Do not assume this lab is free.

```sh
terraform init
terraform fmt -check
terraform validate
# Copy example.tfvars to a local file and replace every example value.
terraform plan -var-file=lab.tfvars -out=lab.tfplan
terraform apply lab.tfplan
```

`example.tfvars` contains reserved documentation addresses and will not provide
a working service. Endpoint inputs have IPv4 syntax validation; that does not
verify reachability, ownership, or distinct failure domains. Domain has no
default to prevent accidentally configuring someone else's zone.

## End-to-end verification

1. Verify both real endpoints serve the application independently.
2. Inspect the `name_servers` output and delegate the new hosted zone from your registrar or parent zone after reviewing existing DNS. Merely creating a zone does not change public DNS.
3. Confirm the primary health check is healthy and query `app.<your-domain>`.
4. In a controlled lab, make the primary health endpoint fail. Check health status, then query again after caches expire.
5. Restore the primary and verify failback. Record observed timing rather than promising instant recovery.

DNS TTL is 60 seconds; resolver/client caches and health-check evaluation affect
observed failover. The configuration does not migrate application state.

## Cleanup and project map

Review domain delegation before removing a zone that is in use.

```sh
terraform plan -destroy -var-file=lab.tfvars
terraform destroy -var-file=lab.tfvars
```

`main.tf` defines resources, `variables.tf` defines endpoint inputs, and
`outputs.tf` exposes zone name servers and health-check ID. State, plans and real
configuration files are ignored. CI checks formatting and provider validation;
live failover remains a manual integration check. Next: standby health checks,
HTTPS, input preconditions, and automated failure/recovery evidence.
