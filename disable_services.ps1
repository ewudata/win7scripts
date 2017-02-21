#   Description:
# This script disables unwanted Windows services. If you do not want to disable
# certain services comment out the corresponding lines below.

$services = @(
    "BITS"                                     # Background Intelligent Transfer Service
    "BFE"                                      # Base Filtering Engine
    "CertPropSvc"                              # Certificate Propagation
    "DPS"                                      # Diagnostic Policy Service
    "WdiServiceHost"                           # Diagnostic Service Host
    "WdiSystemHost"                            # Diagnostic System Host
    "TrkWks"                                   # Distributed Link Tracking Client
    "iphlpsvc"                                 # IP Helper
    "NlaSvc"                                   # Network Location Awareness
    "CscService"                               # Offline Files
    "SessionEnv"                               # Remote Desktop Configuration
    "TermService"                              # Remote Desktop Services
    "UmRdpService"                             # Remote Desktop Services UserMode Port Redirector	
    "wscsvc"                                   # Security Center
    "Themes"                                   # Themes
    "WinDefend"                                # Windows Defender
    "WerSvc"                                   # Windows Error Reporting Service
    "MpsSvc"                                   # Windows Firewall
    "wuauserv"                                 # Windows Update
    "WinHttpAutoProxySvc"                      # WinHTTP Web Proxy Auto-Discovery Service
)

foreach ($service in $services) {
    echo "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
}