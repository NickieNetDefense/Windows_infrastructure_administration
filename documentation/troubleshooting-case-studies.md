# Troubleshooting Case Studies

This document captures representative troubleshooting scenarios completed during the **Windows Infrastructure Administration** project.

The goal is to demonstrate a structured administrative troubleshooting process rather than only showing successful configuration.

Each case follows a repeatable workflow:

**Identify → Isolate → Diagnose → Remediate → Validate → Document**

---

# Case Study 1 — DNS Failure Caused by Client Misconfiguration

## Scenario

CLIENT01 was intentionally configured with an incorrect DNS setting to simulate a common Windows domain connectivity problem.

The workstation retained basic IP connectivity, but domain name resolution failed.

Because Active Directory depends heavily on DNS, this type of failure can affect authentication, domain-controller discovery, Group Policy processing, and access to domain resources.

## Symptoms

Observed behavior included:

- failed domain name resolution
- inability to resolve expected internal hostnames
- degraded access to domain-dependent services
- network connectivity appearing partially functional despite domain failures

## Investigation

The troubleshooting process began by separating basic network connectivity from DNS functionality.

The investigation included reviewing:

- CLIENT01 IPv4 configuration
- configured DNS server
- IP reachability
- hostname resolution
- domain resolution

The client configuration was compared against the known-good domain configuration:

```text
Domain: ellistech.test
DNS Server: 10.10.10.10
```

This identified the incorrect client DNS configuration as the root cause.

## Root Cause

CLIENT01 was not configured to use the Domain Controller as its DNS server.

In an Active Directory environment, domain members must use DNS infrastructure capable of resolving the domain and Active Directory service records.

## Remediation

The DNS configuration on CLIENT01 was corrected to:

```text
DNS Server: 10.10.10.10
```

The client was then retested for domain and host resolution.

## Validation

Successful internal DNS resolution confirmed that the issue had been resolved.

### Evidence

- [81-dns-failure-client-misconfiguration.png](../screenshots/81-dns-failure-client-misconfiguration.png) — intentional client DNS misconfiguration
- [82-dns-failure-diagnosis.png](../screenshots/82-dns-failure-diagnosis.png) — troubleshooting and diagnosis
- [83-dns-resolution-restored.png](../screenshots/83-dns-resolution-restored.png) — DNS resolution restored after remediation

## Troubleshooting Path

**IP Configuration → Connectivity → DNS Configuration → Domain Resolution → Validation**

## Lesson

Basic network connectivity does not guarantee Active Directory functionality.

DNS should be validated early when troubleshooting authentication, domain discovery, Group Policy, or internal resource access in a Windows domain.

---

# Case Study 2 — Departmental File Access Failure Caused by NTFS Permissions

## Scenario

A Finance user who should have been authorized to access the Finance departmental share was denied access.

This scenario was used to troubleshoot the interaction between SMB share permissions, NTFS permissions, and Active Directory security-group membership.

## Symptoms

The Finance user could authenticate to the domain but could not access the expected Finance resource.

The failure demonstrated that successful authentication does not automatically imply authorization to a file resource.

## Investigation

The troubleshooting process reviewed the access path in layers:

1. Confirm user identity.
2. Confirm network access to SRV01.
3. Confirm Finance share availability.
4. Review SMB share permissions.
5. Review NTFS permissions.
6. Verify relevant Active Directory group membership.
7. Compare the user's effective access against the intended access model.

The investigation identified an NTFS permission configuration issue.

## Root Cause

The Finance share's underlying NTFS permissions did not correctly provide the intended access through the authorized Finance security group.

Because Windows evaluates both share permissions and NTFS permissions, the effective access was more restrictive than intended.

## Remediation

The NTFS permissions were corrected to restore the intended role-based access model.

The design continued to use security groups rather than assigning permissions directly to individual users.

Representative model:

```text
GG_Finance_RW → Modify
GG_IT_Admins  → Full Control
```

## Validation

The Finance user was able to access the Finance resource after remediation.

Access controls were also validated to confirm that users from another department remained unable to access unauthorized resources.

### Evidence

- [84-finance-share-access-denied.png](../screenshots/84-finance-share-access-denied.png) — authorized Finance user denied access
- [85-finance-ntfs-permission-misconfiguration.png](../screenshots/85-finance-ntfs-permission-misconfiguration.png) — NTFS permission issue identified
- [86-finance-share-access-restaored.png](../screenshots/86-finance-share-access-restaored.png) — Finance share access restored
- [45-finance-user-hr-share-denied.png](../screenshots/45-finance-user-hr-share-denied.png) — unauthorized HR-share access remained denied

## Troubleshooting Path

**Identity → Network Path → Share Permissions → NTFS Permissions → Group Membership → Effective Access → Validation**

## Lesson

Windows file-access troubleshooting should evaluate both **share permissions and NTFS permissions**.

Testing only one layer can produce an incomplete diagnosis.

---

# Case Study 3 — Group Policy Not Applying Because of GPO Linking

## Scenario

A previously configured login-banner policy was not applying as expected.

The scenario was used to troubleshoot Group Policy scope and linking rather than simply re-creating the policy.

## Symptoms

The expected login banner was missing from the workstation sign-in experience.

The GPO itself existed, but the intended configuration was not reaching the target system.

## Investigation

The troubleshooting process reviewed:

- whether the GPO existed
- whether the policy setting was configured
- whether the GPO was linked to the appropriate scope
- whether the link was enabled
- whether the client was located in the expected OU
- effective Group Policy after policy refresh

This isolated the problem to the GPO's link/application path.

## Root Cause

The login-banner Group Policy was not properly linked or enabled for the intended target scope.

The policy configuration existed, but the client was not receiving it.

## Remediation

The required Group Policy link was restored and enabled.

The client policy state was then refreshed and retested.

## Validation

The login-banner policy successfully applied and the interactive sign-in banner returned.

### Evidence

- [87-gpo-policy-missing.png](../screenshots/87-gpo-policy-missing.png) — expected policy behavior missing
- [88-gpo-add-link-enable-to-banner.png](../screenshots/88-gpo-add-link-enable-to-banner.png) — required GPO link restored/enabled
- [89-gpo-banner-policy-restored.png](../screenshots/89-gpo-banner-policy-restored.png) — policy application restored
- [90-gpo-login-banner-restored.png](../screenshots/90-gpo-login-banner-restored.png) — interactive login banner validated

## Troubleshooting Path

**GPO Configuration → Link → Scope → Target Object → Policy Refresh → Effective Policy → Validation**

## Lesson

When a Group Policy setting does not apply, the problem may not be the setting itself.

The complete delivery path must be evaluated:

**Configuration → Link → Scope → Security Filtering → Target OU → Client Processing**

---

# Case Study 4 — Account Lockout Policy Not Behaving as Expected

## Scenario

The domain account-lockout policy was configured to lock accounts after repeated failed authentication attempts.

During validation, the expected lockout behavior did not initially occur as intended.

Rather than assuming the policy was correctly applied, the effective Group Policy configuration was investigated.

## Symptoms

Repeated failed logon attempts did not initially produce the expected account-lockout behavior.

This indicated that the configured policy and the effective policy were not aligned.

## Investigation

The troubleshooting process included:

- confirming the configured account-lockout settings
- reviewing Group Policy application
- checking GPO link order
- validating which policy was effectively controlling the account-lockout behavior
- retesting after correction

The investigation identified a Group Policy precedence/link-order issue.

## Root Cause

The intended account-lockout policy was not winning the effective Group Policy evaluation because of GPO link-order behavior.

## Remediation

The Group Policy link order was corrected so the intended account-lockout configuration became effective.

The policy was then refreshed and validated again.

## Validation

After remediation:

- the intended policy became effective
- repeated failed authentication attempts triggered account lockout
- the account was administratively unlocked
- successful authentication was restored

### Evidence

- [60-gpo-lockout-enable-troubleshooting.png](../screenshots/60-gpo-lockout-enable-troubleshooting.png) — account-lockout policy application investigated
- [62-gpo-link-order-fix-lockout.png](../screenshots/62-gpo-link-order-fix-lockout.png) — GPO link order corrected
- [63-gpo-lockout-fix-validated.png](../screenshots/63-gpo-lockout-fix-validated.png) — effective policy correction validated
- [64-account-lockout-triggered.png](../screenshots/64-account-lockout-triggered.png) — lockout successfully triggered
- [65-account-unlock-in-ADDC.png](../screenshots/65-account-unlock-in-ADDC.png) — account administratively unlocked
- [66-account-login-restored.png](../screenshots/66-account-login-restored.png) — successful authentication restored

## Troubleshooting Path

**Configured Policy → Effective Policy → GPO Precedence → Authentication Test → Lockout → Recovery → Validation**

## Lesson

A configured Group Policy setting is not automatically an effective setting.

Troubleshooting must distinguish between what exists in the GPO and what the target system or domain actually receives.

---

# Additional Troubleshooting Evidence

The project also includes evidence of administrative investigation during the initial Active Directory deployment.

Examples include:

- Server Manager alerts reviewed
- Windows Event Viewer warnings reviewed
- `dcdiag` used for domain-controller diagnostics
- DFSR warnings investigated
- Active Directory core services validated
- historical event data distinguished from active infrastructure problems

Representative evidence:

- [17-server-manager-alerts-observed.png](../screenshots/17-server-manager-alerts-observed.png)
- [18-event-log-warnings-reviewed.png](../screenshots/18-event-log-warnings-reviewed.png)
- [19-ad-core-services-validated.png](../screenshots/19-ad-core-services-validated.png)
- [20-dcdiag-dfsr-warning-confirmed.png](../screenshots/20-dcdiag-dfsr-warning-confirmed.png)
- [21-dfsr-event-history-investigated.png](../screenshots/21-dfsr-event-history-investigated.png)

---

# Troubleshooting Principles Demonstrated

Across the project, troubleshooting followed several repeatable principles.

## 1. Validate the Lowest Relevant Layer First

Examples:

```text
IP connectivity before DNS
DNS before Active Directory discovery
Identity before authorization
GPO delivery before individual policy settings
```

## 2. Separate Configuration From Effective State

A setting existing in a management console does not prove that it is operational.

Validation was performed from the affected endpoint or service whenever possible.

## 3. Use Narrow Tests

Instead of changing multiple settings at once, each failure was isolated to a specific dependency or control.

This made it possible to identify the actual root cause and validate the remediation.

## 4. Validate Both Positive and Negative Outcomes

Successful access was not considered sufficient proof by itself.

The project also validated that:

- unauthorized departmental file access remained denied
- standard users remained non-administrators
- security controls continued to apply after remediation

## 5. Confirm Recovery

Troubleshooting was not considered complete until the expected service or control had been restored and retested.

---

# Troubleshooting Summary

The project demonstrates troubleshooting across multiple Windows infrastructure layers:

| Area | Failure | Root Cause | Resolution |
|---|---|---|---|
| DNS | Domain resolution failed | Incorrect client DNS configuration | Restored DC01 as client DNS server |
| File Services | Authorized Finance access denied | NTFS permission misconfiguration | Corrected group-based NTFS access |
| Group Policy | Login banner missing | GPO link/application issue | Restored and enabled correct GPO link |
| Authentication Policy | Lockout behavior incorrect | GPO link-order / precedence issue | Corrected effective policy order |
| AD Health | DFSR / service warnings observed | Required investigation of active vs historical conditions | Validated services and reviewed diagnostic/event evidence |

---

# Final Outcome

These scenarios demonstrate the ability to troubleshoot Windows infrastructure by following dependencies, validating effective configuration, identifying root causes, applying targeted remediation, and confirming recovery with technical evidence.

The troubleshooting approach used throughout the project can be summarized as:

**Observe → Isolate → Test → Correct → Re-Test → Document**
