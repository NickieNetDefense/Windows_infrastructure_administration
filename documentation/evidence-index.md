# Evidence Index

This document provides an index of the technical evidence captured during the **Windows Infrastructure Administration** project.

The complete screenshot archive is intentionally preserved as part of this repository.

The README highlights the strongest evidence for quick review, while this index provides a chronological record of the environment being designed, deployed, administered, secured, automated, troubleshot, recovered, and validated.

---

# Phase 1 — Virtual Network & Windows Server Baseline

| # | Screenshot | Evidence |
|---:|---|---|
| 01 | [01-virtual-network.png](../screenshots/01-virtual-network.png) | VirtualBox network created for the Windows infrastructure environment |
| 02 | [02-dc01-vm-config.png](../screenshots/02-dc01-vm-config.png) | DC01 virtual machine resource configuration |
| 03 | [03-dc01-server-manager-baseline.png](../screenshots/03-dc01-server-manager-baseline.png) | Initial Windows Server baseline and Server Manager state |
| 04 | [04-dc01-local-server.png](../screenshots/04-dc01-local-server.png) | DC01 local server configuration before domain deployment |
| 05 | [05-dc01-hostname-static-ip.png](../screenshots/05-dc01-hostname-static-ip.png) | DC01 hostname and static IPv4 configuration |

---

# Phase 2 — Active Directory Domain Services & DNS Deployment

| # | Screenshot | Evidence |
|---:|---|---|
| 06 | [06-ad-ds-dns-roles-selected.png](../screenshots/06-ad-ds-dns-roles-selected.png) | Active Directory Domain Services and DNS roles selected for installation |
| 07 | [07-promote-dc-notification.png](../screenshots/07-promote-dc-notification.png) | Server Manager domain-controller promotion workflow |
| 08 | [08-dc01-prereq-check-success.png](../screenshots/08-dc01-prereq-check-success.png) | Successful prerequisite validation before domain-controller promotion |
| 09 | [09-active-directory-domain-created.png](../screenshots/09-active-directory-domain-created.png) | `ellistech.test` Active Directory domain successfully created |
| 10 | [10-dns-forward-lookup-zone.png](../screenshots/10-dns-forward-lookup-zone.png) | DNS forward lookup zone created for the domain |
| 11 | [11-dns-resolution-validation.png](../screenshots/11-dns-resolution-validation.png) | DNS resolution validated after AD DS and DNS deployment |
| 12 | [12-dcdiag-validation.png](../screenshots/12-dcdiag-validation.png) | Initial Domain Controller diagnostic validation |
| 13 | [13-dfsr-failed.png](../screenshots/13-dfsr-failed.png) | DFSR-related diagnostic failure identified during validation |
| 14 | [14-ad-replication-validation.png](../screenshots/14-ad-replication-validation.png) | Active Directory replication/service state validated |

---

# Phase 3 — Organizational Design, Identity & Security Groups

| # | Screenshot | Evidence |
|---:|---|---|
| 15 | [15-active-directory-ou-structure.png](../screenshots/15-active-directory-ou-structure.png) | Enterprise-style OU structure created for users, computers, servers, groups, and privileged accounts |
| 16 | [16-ad-security-group-membership.png](../screenshots/16-ad-security-group-membership.png) | Department and administrative security-group membership configured |
| 17 | [17-server-manager-alerts-observed.png](../screenshots/17-server-manager-alerts-observed.png) | Server Manager alerts reviewed as part of administrative monitoring |
| 18 | [18-event-log-warnings-reviewed.png](../screenshots/18-event-log-warnings-reviewed.png) | Windows Event Viewer warnings reviewed during infrastructure validation |
| 19 | [19-ad-core-services-validated.png](../screenshots/19-ad-core-services-validated.png) | Core Active Directory services validated |
| 20 | [20-dcdiag-dfsr-warning-confirmed.png](../screenshots/20-dcdiag-dfsr-warning-confirmed.png) | DFSR warning confirmed through `dcdiag` |
| 21 | [21-dfsr-event-history-investigated.png](../screenshots/21-dfsr-event-history-investigated.png) | DFSR event history investigated to distinguish active issues from historical warnings |

---

# Phase 4 — Member Server & File Services

| # | Screenshot | Evidence |
|---:|---|---|
| 22 | [22-srv01-vm-configuration.png](../screenshots/22-srv01-vm-configuration.png) | SRV01 member-server VM configuration |
| 23 | [23-srv01-static-ip-and-hostname.png](../screenshots/23-srv01-static-ip-and-hostname.png) | SRV01 hostname, static IP, and DNS configuration |
| 24 | [24-srv01-domain-join-success.png](../screenshots/24-srv01-domain-join-success.png) | SRV01 successfully joined to the EllisTech domain |
| 25 | [25-srv01-server-ou-placement.png](../screenshots/25-srv01-server-ou-placement.png) | SRV01 placed in the dedicated Servers OU |
| 26 | [26-finance-share-permissions.png](../screenshots/26-finance-share-permissions.png) | Finance SMB share permissions configured using security groups |
| 27 | [27-hr-share-permissions.png](../screenshots/27-hr-share-permissions.png) | HR SMB share permissions configured using security groups |
| 28 | [28-finance-ntfs-permissions.png](../screenshots/28-finance-ntfs-permissions.png) | Finance NTFS permissions configured |
| 29 | [29-hr-ntfs-permissions.png](../screenshots/29-hr-ntfs-permissions.png) | HR NTFS permissions configured |
| 30 | [30-remove-inheritance-users.png](../screenshots/30-remove-inheritance-users.png) | Broad inherited permissions removed to enforce least privilege |
| 31 | [31-file-access-group-membership.png](../screenshots/31-file-access-group-membership.png) | File-access security-group membership validated |

---

# Phase 5 — Windows 11 Client Deployment & Domain Join

| # | Screenshot | Evidence |
|---:|---|---|
| 32 | [32-client01-vm-configuration.png](../screenshots/32-client01-vm-configuration.png) | CLIENT01 Windows 11 VM configuration |
| 33 | [33-client01-windows-installed.png](../screenshots/33-client01-windows-installed.png) | Windows 11 installation completed on CLIENT01 |
| 34 | [34-client01-static-ip-and-dns.png](../screenshots/34-client01-static-ip-and-dns.png) | CLIENT01 static IPv4 and domain DNS configuration |
| 35 | [35-client01-dns-connectivity-validation.png](../screenshots/35-client01-dns-connectivity-validation.png) | CLIENT01 DNS connectivity validated |
| 36 | [36-client01-ipv4-connectivity-validation.png](../screenshots/36-client01-ipv4-connectivity-validation.png) | CLIENT01 IPv4 connectivity validated |
| 37 | [37-client01-domain-dns-resolution.png](../screenshots/37-client01-domain-dns-resolution.png) | Domain name resolution validated from CLIENT01 |
| 38 | [38-client01-dc-fqdn-resolution.png](../screenshots/38-client01-dc-fqdn-resolution.png) | DC01 FQDN resolution validated from CLIENT01 |
| 39 | [39-client01-network-configuration-validation.png](../screenshots/39-client01-network-configuration-validation.png) | CLIENT01 final network configuration reviewed |
| 40 | [40-client01-domain-join-success.png](../screenshots/40-client01-domain-join-success.png) | CLIENT01 successfully joined to `ellistech.test` |
| 41 | [41-client01-domain-user-login.png](../screenshots/41-client01-domain-user-login.png) | Successful authentication to CLIENT01 with a domain identity |
| 42 | [42-client01-workstation-ou-placement.png](../screenshots/42-client01-workstation-ou-placement.png) | CLIENT01 placed in the Workstations OU |

---

# Phase 6 — Role-Based File Access Validation

| # | Screenshot | Evidence |
|---:|---|---|
| 43 | [43-finance-user-finance-share-access.png](../screenshots/43-finance-user-finance-share-access.png) | Finance user accessed the authorized Finance share |
| 44 | [44-finance-user-finance-share-access-confirmed.png](../screenshots/44-finance-user-finance-share-access-confirmed.png) | Authorized Finance share access confirmed |
| 45 | [45-finance-user-hr-share-denied.png](../screenshots/45-finance-user-hr-share-denied.png) | Finance user denied access to the HR share |

---

# Phase 7 — Group Policy & Endpoint Security

| # | Screenshot | Evidence |
|---:|---|---|
| 46 | [46-gpo-password-policy.png](../screenshots/46-gpo-password-policy.png) | Domain password policy configured through Group Policy |
| 47 | [47-gpo-account-lockout-policy.png](../screenshots/47-gpo-account-lockout-policy.png) | Account lockout policy configured |
| 48 | [48-gpo-screen-lock-security-option.png](../screenshots/48-gpo-screen-lock-security-option.png) | Computer-side inactivity lock policy configured |
| 49 | [49-gpo-screen-lock-user-settings.png](../screenshots/49-gpo-screen-lock-user-settings.png) | User-side screen-lock settings configured |
| 50 | [50-gpo-windows-firewall.png](../screenshots/50-gpo-windows-firewall.png) | Windows Firewall policy centrally enforced through Group Policy |
| 51 | [51-gpo-defender.png](../screenshots/51-gpo-defender.png) | Microsoft Defender policy centrally enforced through Group Policy |
| 52 | [52-gpo-login-banner-settings.png](../screenshots/52-gpo-login-banner-settings.png) | Administrative login banner configured through Group Policy |
| 53 | [53-gpo-computer-policy-validation.png](../screenshots/53-gpo-computer-policy-validation.png) | Effective computer-side Group Policy validated on CLIENT01 |
| 54 | [54-standard-user-not-local-admin-verify.png](../screenshots/54-standard-user-not-local-admin-verify.png) | Standard domain user verified as non-administrator |
| 55 | [55-domain-private-firewall-enabled-true.png](../screenshots/55-domain-private-firewall-enabled-true.png) | Domain and Private Windows Firewall profiles validated as enabled |
| 56 | [56-public-firewall-enabled-true.png](../screenshots/56-public-firewall-enabled-true.png) | Public Windows Firewall profile validated as enabled |
| 57 | [57-microsoft-defender-active-true.png](../screenshots/57-microsoft-defender-active-true.png) | Microsoft Defender Antivirus validated as active |
| 58 | [58-real-time-protection-active-true.png](../screenshots/58-real-time-protection-active-true.png) | Microsoft Defender real-time protection validated as active |

---

# Phase 8 — Security Auditing, Account Lockout & Recovery

| # | Screenshot | Evidence |
|---:|---|---|
| 59 | [59-test-failed-logon.png](../screenshots/59-test-failed-logon.png) | Intentional failed authentication generated for audit testing |
| 60 | [60-gpo-lockout-enable-troubleshooting.png](../screenshots/60-gpo-lockout-enable-troubleshooting.png) | Account-lockout policy application investigated |
| 61 | [61-Success-4624-failed-4625-logon-events.png](../screenshots/61-Success-4624-failed-4625-logon-events.png) | Security log reviewed for successful Event ID 4624 and failed Event ID 4625 logons |
| 62 | [62-gpo-link-order-fix-lockout.png](../screenshots/62-gpo-link-order-fix-lockout.png) | GPO link order corrected during account-lockout troubleshooting |
| 63 | [63-gpo-lockout-fix-validated.png](../screenshots/63-gpo-lockout-fix-validated.png) | Account-lockout policy correction validated |
| 64 | [64-account-lockout-triggered.png](../screenshots/64-account-lockout-triggered.png) | Configured account-lockout threshold successfully triggered |
| 65 | [65-account-unlock-in-ADDC.png](../screenshots/65-account-unlock-in-ADDC.png) | Locked account administratively unlocked in Active Directory |
| 66 | [66-account-login-restored.png](../screenshots/66-account-login-restored.png) | Successful authentication restored after account recovery |

---

# Phase 9 — PowerShell Administration & Automation

| # | Screenshot | Evidence |
|---:|---|---|
| 67 | [67-powershell-get-aduser.png](../screenshots/67-powershell-get-aduser.png) | Active Directory users queried with PowerShell |
| 68 | [68-powershell-get-adgroup.png](../screenshots/68-powershell-get-adgroup.png) | Active Directory groups queried with PowerShell |
| 69 | [69-powershell-get-adcomputer.png](../screenshots/69-powershell-get-adcomputer.png) | Domain computers queried with PowerShell |
| 70 | [70-powershell-get-adorganizationalunit.png](../screenshots/70-powershell-get-adorganizationalunit.png) | Organizational Units queried with PowerShell |
| 71 | [71-powershell-bulk-user-creation.png](../screenshots/71-powershell-bulk-user-creation.png) | Bulk Active Directory user provisioning executed with PowerShell |
| 72 | [72-bulk-created-ad-users.png](../screenshots/72-bulk-created-ad-users.png) | Bulk-created user accounts validated in Active Directory |
| 73 | [73-enterprise-hr-onboarding-script-execution.png](../screenshots/73-enterprise-hr-onboarding-script-execution.png) | CSV-driven HR-to-IT onboarding script executed |
| 74 | [74-enterprise-onboarding-ad-validation.png](../screenshots/74-enterprise-onboarding-ad-validation.png) | Provisioned onboarding identities validated in Active Directory |
| 75 | [75-ad-user-report-script-execution.png](../screenshots/75-ad-user-report-script-execution.png) | Active Directory user-report automation executed |
| 76 | [76-ad-user-audit-report.png](../screenshots/76-ad-user-audit-report.png) | Generated Active Directory identity audit report reviewed |
| 77 | [77-ad-computer-inventory-script-execution.png](../screenshots/77-ad-computer-inventory-script-execution.png) | Domain computer inventory script executed |
| 78 | [78-ad-computer-inventory-report.png](../screenshots/78-ad-computer-inventory-report.png) | Generated computer inventory report reviewed |
| 79 | [79-disabled-users-report-script-execution.png](../screenshots/79-disabled-users-report-script-execution.png) | Disabled-user audit script executed |
| 80 | [80-disabled-users-audit-report.png](../screenshots/80-disabled-users-audit-report.png) | Disabled-user report generated for identity hygiene review |

---

# Phase 10 — DNS Troubleshooting & Recovery

| # | Screenshot | Evidence |
|---:|---|---|
| 81 | [81-dns-failure-client-misconfiguration.png](../screenshots/81-dns-failure-client-misconfiguration.png) | Intentional CLIENT01 DNS misconfiguration introduced |
| 82 | [82-dns-failure-diagnosis.png](../screenshots/82-dns-failure-diagnosis.png) | DNS failure diagnosed through network and name-resolution testing |
| 83 | [83-dns-resolution-restored.png](../screenshots/83-dns-resolution-restored.png) | Domain DNS resolution restored after correcting client configuration |

---

# Phase 11 — File Permission Troubleshooting & Recovery

| # | Screenshot | Evidence |
|---:|---|---|
| 84 | [84-finance-share-access-denied.png](../screenshots/84-finance-share-access-denied.png) | Intentional Finance share access failure reproduced |
| 85 | [85-finance-ntfs-permission-misconfiguration.png](../screenshots/85-finance-ntfs-permission-misconfiguration.png) | NTFS permission misconfiguration identified as the access-control root cause |
| 86 | [86-finance-share-access-restaored.png](../screenshots/86-finance-share-access-restaored.png) | Finance share access restored after permission remediation |

---

# Phase 12 — Group Policy Troubleshooting & Recovery

| # | Screenshot | Evidence |
|---:|---|---|
| 87 | [87-gpo-policy-missing.png](../screenshots/87-gpo-policy-missing.png) | Missing Group Policy behavior reproduced during troubleshooting |
| 88 | [88-gpo-add-link-enable-to-banner.png](../screenshots/88-gpo-add-link-enable-to-banner.png) | Required GPO link restored/enabled |
| 89 | [89-gpo-banner-policy-restored.png](../screenshots/89-gpo-banner-policy-restored.png) | Login-banner policy application restored |
| 90 | [90-gpo-login-banner-restored.png](../screenshots/90-gpo-login-banner-restored.png) | Interactive login banner successfully validated after remediation |

---

# Phase 13 — Final Infrastructure Validation

| # | Screenshot | Evidence |
|---:|---|---|
| 91 | [91-dcdiag-final-health-validation-1.png](../screenshots/91-dcdiag-final-health-validation-1.png) | Final Domain Controller health validation with `dcdiag` |
| 92 | [92-dcdiag-final-health-validation-2.png](../screenshots/92-dcdiag-final-health-validation-2.png) | Additional final Domain Controller diagnostic results |
| 93 | [93-final-dns-validation.png](../screenshots/93-final-dns-validation.png) | Final domain DNS validation |
| 94 | [94-final-domain-authentication-validation.png](../screenshots/94-final-domain-authentication-validation.png) | Final domain authentication validation |
| 95 | [95-final-gpo-validation.png](../screenshots/95-final-gpo-validation.png) | Final Group Policy validation |
| 96 | [96-final-windows-firewall-validation.png](../screenshots/96-final-windows-firewall-validation.png) | Final Windows Firewall validation |
| 97 | [97-final-microsoft-defender-validation.png](../screenshots/97-final-microsoft-defender-validation.png) | Final Microsoft Defender validation |
| 98 | [98-final-user-privilegas-validated.png](../screenshots/98-final-user-privilegas-validated.png) | Final standard-user privilege validation |
| 99 | [99-final-file-permission-validation.png](../screenshots/99-final-file-permission-validation.png) | Final departmental file-permission validation |

---

# Final Validation Summary

| Screenshot | Evidence |
|---|---|
| [Validation_Summary.png](../screenshots/Validation_Summary.png) | Consolidated final validation summary for the completed environment |

---

# Competency Evidence Map

| Competency | Representative Evidence |
|---|---|
| Windows Server deployment & administration | [02](../screenshots/02-dc01-vm-config.png), [03](../screenshots/03-dc01-server-manager-baseline.png), [05](../screenshots/05-dc01-hostname-static-ip.png) |
| Active Directory Domain Services | [09](../screenshots/09-active-directory-domain-created.png), [15](../screenshots/15-active-directory-ou-structure.png), [16](../screenshots/16-ad-security-group-membership.png) |
| DNS administration | [10](../screenshots/10-dns-forward-lookup-zone.png), [11](../screenshots/11-dns-resolution-validation.png), [93](../screenshots/93-final-dns-validation.png) |
| Domain membership & authentication | [24](../screenshots/24-srv01-domain-join-success.png), [40](../screenshots/40-client01-domain-join-success.png), [41](../screenshots/41-client01-domain-user-login.png) |
| File services & least privilege | [28](../screenshots/28-finance-ntfs-permissions.png), [29](../screenshots/29-hr-ntfs-permissions.png), [45](../screenshots/45-finance-user-hr-share-denied.png) |
| Group Policy administration | [46](../screenshots/46-gpo-password-policy.png), [50](../screenshots/50-gpo-windows-firewall.png), [53](../screenshots/53-gpo-computer-policy-validation.png) |
| Endpoint hardening | [54](../screenshots/54-standard-user-not-local-admin-verify.png), [55](../screenshots/55-domain-private-firewall-enabled-true.png), [57](../screenshots/57-microsoft-defender-active-true.png) |
| Security auditing & authentication events | [59](../screenshots/59-test-failed-logon.png), [61](../screenshots/61-Success-4624-failed-4625-logon-events.png) |
| Account lockout & recovery | [64](../screenshots/64-account-lockout-triggered.png), [65](../screenshots/65-account-unlock-in-ADDC.png), [66](../screenshots/66-account-login-restored.png) |
| PowerShell administration | [67](../screenshots/67-powershell-get-aduser.png), [68](../screenshots/68-powershell-get-adgroup.png), [70](../screenshots/70-powershell-get-adorganizationalunit.png) |
| Automation & reporting | [73](../screenshots/73-enterprise-hr-onboarding-script-execution.png), [76](../screenshots/76-ad-user-audit-report.png), [78](../screenshots/78-ad-computer-inventory-report.png), [80](../screenshots/80-disabled-users-audit-report.png) |
| DNS troubleshooting | [81](../screenshots/81-dns-failure-client-misconfiguration.png), [82](../screenshots/82-dns-failure-diagnosis.png), [83](../screenshots/83-dns-resolution-restored.png) |
| Permissions troubleshooting | [84](../screenshots/84-finance-share-access-denied.png), [85](../screenshots/85-finance-ntfs-permission-misconfiguration.png), [86](../screenshots/86-finance-share-access-restaored.png) |
| Group Policy troubleshooting | [87](../screenshots/87-gpo-policy-missing.png), [88](../screenshots/88-gpo-add-link-enable-to-banner.png), [90](../screenshots/90-gpo-login-banner-restored.png) |
| Final operational validation | [91](../screenshots/91-dcdiag-final-health-validation-1.png), [94](../screenshots/94-final-domain-authentication-validation.png), [99](../screenshots/99-final-file-permission-validation.png) |

---

# Evidence Philosophy

The screenshot archive is intentionally broader than the evidence embedded in the main README.

The README is designed for a fast technical review and highlights representative proof of the strongest project outcomes. This index preserves the complete chronological trail so a reviewer can inspect how the environment evolved, how failures were diagnosed, how controls were validated, and how final operational health was confirmed.

Evidence is organized to demonstrate not only successful configuration, but also **administrative reasoning, troubleshooting, remediation, recovery, and validation**.

---

# Project Validation Summary

The completed evidence set demonstrates an end-to-end Windows infrastructure administration lifecycle:

**Design → Deploy → Configure → Secure → Automate → Test → Troubleshoot → Recover → Validate → Document**

Representative final validation confirms:

- Domain Controller health
- Active Directory and DNS functionality
- domain authentication
- Group Policy application
- Windows Firewall enforcement
- Microsoft Defender protection
- standard-user least privilege
- departmental file-access controls
- repeatable PowerShell administration and reporting
- successful recovery from intentionally introduced DNS, permission, and Group Policy failures

---

# Final Outcome

The evidence archive demonstrates the ability to build and administer an enterprise-style Windows environment while validating identity, access, policy, endpoint security, automation, troubleshooting, and recovery workflows with documented technical proof.