#   Description:
# This script disables unwanted Windows services. If you do not want to disable
# certain services comment out the corresponding lines below.
# !!!!
# Set-ExecutionPolicy Unrestricted

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

#bonus 1
echo "stop Aero..."
sc stop uxsms

#bonus 2
# dism /online /Get-Features /Format:Table

$features = @(
    "WindowsGadgetPlatform"        
    "MediaPlayback"         
    "WindowsMediaPlayer"                          
    "MediaCenter"                                
    "OpticalMediaDisc"                            
    "NetFx3"                                  
    "TabletPCOC"                                  
    "Printing-Foundation-Features"
    "Printing-Foundation-InternetPrinting-Client" 
    "FaxServicesClientPackage"                 
    "MSRDC-Infrastructure"                        
    "Printing-XPSServices-Features"
    "Xps-Foundation-Xps-Viewer"                   
    "SearchEngine-Client-Package"                
    # Internet-Explorer-Optional-x86
)

foreach ($feature in $features) {
    echo "Trying to disable $feature"
    dism /online /Disable-Feature /FeatureName:$feature /NoRestart /Quiet
}

#disable UAC
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force


