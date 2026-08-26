# Lab Architecture

```mermaid
flowchart TB
    A[Windows 11 Lenovo Host] --> B[Oracle VirtualBox]
    B --> C[P01-LAB NAT Network<br/>10.10.10.0/24]

    C --> DC[DC01<br/>10.10.10.10<br/>Windows Server 2025<br/>AD DS + DNS]
    C --> SRV[SRV01<br/>10.10.10.20<br/>Windows Server 2025<br/>Member Server / File Server]
    C --> CL[CLIENT01<br/>10.10.10.30<br/>Windows 11<br/>Domain Workstation]

    DC --> D1[ellistech.test<br/>Authentication<br/>Directory Services<br/>Group Policy]
    SRV --> S1[Finance Share<br/>HR Share<br/>NTFS Permissions<br/>RBAC]
    CL --> C1[Domain User Login<br/>GPO Enforcement<br/>Firewall / Defender]

    DC --- SRV
    DC --- CL
    D1 --- S1
    D1 --- C1