#!/system/bin/sh
LOG="/data/local/tmp/A06-EF.log"
#deBLOATER
echo "DEBLOATER" >> "$LOG"
echo "" >> "$LOG"

REM=0

# service mode ril
pm uninstall --user 0 com.sec.android.RilServiceModeApp >/dev/null 2>&1 && REM=$((REM+1))

# Samsung ODA service. #######spy app
pm uninstall --user 0 com.samsung.oda.service >/dev/null 2>&1 && REM=$((REM+1))

# iaft logger
pm uninstall --user 0 com.sec.android.iaft >/dev/null 2>&1 && REM=$((REM+1))

# eSIM Client ######## maybe, ui
pm uninstall --user 0 com.samsung.android.app.telephonyui.esimclient >/dev/null 2>&1 && REM=$((REM+1))

# diagmonagent companion ##########spy
pm uninstall --user 0 com.samsung.android.dsms >/dev/null 2>&1 && REM=$((REM+1))

# Countinuity service ##########bloatware
pm uninstall --user 0 com.samsung.android.mcfds >/dev/null 2>&1 && REM=$((REM+1))

# boot camera service
pm uninstall --user 0 com.sec.android.app.camerasaver >/dev/null 2>&1 && REM=$((REM+1))

# Knox bullshit (kpe core)
pm uninstall --user 0 com.samsung.android.knox.kpecore >/dev/null 2>&1 && REM=$((REM+1))

# Facebook App stub ######meta spyware
pm uninstall --user 0 com.facebook.appmanager >/dev/null 2>&1 && REM=$((REM+1))

# Credential Manager ######no use
pm uninstall --user 0 com.android.credentialmanager >/dev/null 2>&1 && REM=$((REM+1))

# Google Print Service Recommendation
pm uninstall --user 0 com.google.android.printservice.recommendation >/dev/null 2>&1 && REM=$((REM+1))

# Google Android System Intelligence ######resource hog
pm uninstall --user 0 com.google.android.overlay.gmsconfig.asi >/dev/null 2>&1 && REM=$((REM+1))

# TalkBack Accessibility Service
pm uninstall --user 0 com.samsung.android.accessibility.talkback >/dev/null 2>&1 && REM=$((REM+1))

# Google On-Device Personalization Services  #####resource hog
pm uninstall --user 0 com.google.android.ondevicepersonalization.services >/dev/null 2>&1 && REM=$((REM+1))

# Blocked Numbers Database Provider
pm uninstall --user 0 com.android.providers.blockednumber >/dev/null 2>&1 && REM=$((REM+1))

# Knox Attestation Client
pm uninstall --user 0 com.samsung.android.knox.attestation >/dev/null 2>&1 && REM=$((REM+1))

# Knox VPN Proxy Handler
pm uninstall --user 0 com.knox.vpn.proxyhandler >/dev/null 2>&1 && REM=$((REM+1))

# Smart Call Spam Protection Provider
pm uninstall --user 0 com.samsung.android.smartcallprovider >/dev/null 2>&1 && REM=$((REM+1))

# Emergency Broadcast Configuration Service
pm uninstall --user 0 com.sec.bcservice >/dev/null 2>&1 && REM=$((REM+1))

# Sasmsung voice bullshit
pm uninstall --user 0 com.samsung.android.intellivoiceservice >/dev/null 2>&1 && REM=$((REM+1))

# Google Location History Engine
pm uninstall --user 0 com.google.android.gms.location.history >/dev/null 2>&1 && REM=$((REM+1))

# Setup Wizard Legal Provider
pm uninstall --user 0 com.sec.android.app.setupwizardlegalprovider >/dev/null 2>&1 && REM=$((REM+1))

# Aura / IronSource spyware ### spyware, dangerous
pm uninstall --user 0 com.aura.oobe.samsung.gl >/dev/null 2>&1 && REM=$((REM+1))

# Mobile Device Management System Backend
pm uninstall --user 0 com.samsung.android.mdm >/dev/null 2>&1 && REM=$((REM+1))

# Hiya Caller ID & Spam Protection
pm uninstall --user 0 com.hiya.star >/dev/null 2>&1 && REM=$((REM+1))

# samsung rro for phone stuffs
pm uninstall --user 0 com.android.phone.auto_generated_characteristics_rro >/dev/null 2>&1 && REM=$((REM+1))

# perso ### unknown bloatware
pm uninstall --user 0 com.sec.android.app.personalization >/dev/null 2>&1 && REM=$((REM+1))

# Knox BBC Agent
pm uninstall --user 0 com.samsung.android.bbc.bbcagent >/dev/null 2>&1 && REM=$((REM+1))

# Shortcut BNR #### smart swicth online stuffs
pm uninstall --user 0 com.samsung.android.shortcutbackupservice >/dev/null 2>&1 && REM=$((REM+1))

# Multi-Connectivity Framework Server ###### no use
pm uninstall --user 0 com.samsung.android.mcfserver >/dev/null 2>&1 && REM=$((REM+1))

# Digital Wellbeing Parental Controls Interface
pm uninstall --user 0 com.samsung.android.app.parentalcare >/dev/null 2>&1 && REM=$((REM+1))

# Google Geo Time Zone Configuration Overlay
pm uninstall --user 0 com.google.android.overlay.gmsconfig.geotz >/dev/null 2>&1 && REM=$((REM+1))

# Built-In Hardware Diagnostics Utility
pm uninstall --user 0 com.android.devicediagnostics >/dev/null 2>&1 && REM=$((REM+1))

# Factory Keystring Hardware Diagnostic Tool
pm uninstall --user 0 com.sec.android.app.factorykeystring >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Bluetooth System Agent  #### bluetooth test services used in factory
pm uninstall --user 0 com.sec.android.app.bluetoothagent >/dev/null 2>&1 && REM=$((REM+1))

# Google Federated Compute Machine Learning Service # bloatware, resource hog, maybe spy app
pm uninstall --user 0 com.google.android.federatedcompute >/dev/null 2>&1 && REM=$((REM+1))

# samsung online stuff
pm uninstall --user 0 com.samsung.android.visual.cloudcore >/dev/null 2>&1 && REM=$((REM+1))

# modem logger # resource hog
pm uninstall --user 0 com.sec.modem.settings >/dev/null 2>&1 && REM=$((REM+1))

# Device Business Sync Cloud Backend ### no use
pm uninstall --user 0 com.samsung.android.dbsc >/dev/null 2>&1 && REM=$((REM+1))

# Knox Container Workspace Core
pm uninstall --user 0 com.samsung.android.container >/dev/null 2>&1 && REM=$((REM+1))

# MediaTek Modem Diagnostic Architecture Configuration
pm uninstall --user 0 com.mediatek.mdmconfig >/dev/null 2>&1 && REM=$((REM+1))

# Non-Framework Location Privacy Extension
pm uninstall --user 0 com.sec.location.nfwlocationprivacy >/dev/null 2>&1 && REM=$((REM+1))

# Real-Time Call Assistant Automation Backend
pm uninstall --user 0 com.samsung.android.callassistant >/dev/null 2>&1 && REM=$((REM+1))

# Google Partner Provisioning Setup
pm uninstall --user 0 com.google.android.partnersetup >/dev/null 2>&1 && REM=$((REM+1))

# Google Carrier Wi-Fi Helper Module
pm uninstall --user 0 com.google.android.apps.carrier.carrierwifi >/dev/null 2>&1 && REM=$((REM+1))

# Android System Feedback Submission Service
pm uninstall --user 0 com.google.android.feedback >/dev/null 2>&1 && REM=$((REM+1))

# Device Security (McAfee Engine Integration)
pm uninstall --user 0 com.samsung.android.sm.devicesecurity >/dev/null 2>&1 && REM=$((REM+1))

# Home Screen App Notification Badges Provider
pm uninstall --user 0 com.sec.android.provider.badge >/dev/null 2>&1 && REM=$((REM+1))

# Important Safety and Health Documentation Viewer
pm uninstall --user 0 com.samsung.safetyinformation >/dev/null 2>&1 && REM=$((REM+1))

# Android Opportunistic Network Service (Dual-SIM Management)
pm uninstall --user 0 com.android.ons >/dev/null 2>&1 && REM=$((REM+1))

# AR Camera Stickers Extension
pm uninstall --user 0 com.sec.android.app.camera.sticker >/dev/null 2>&1 && REM=$((REM+1))

# Consumer Software Customization Regional Network Configuration
pm uninstall --user 0 com.samsung.sec.android.application.csc >/dev/null 2>&1 && REM=$((REM+1))

# Google OOBE Provisioning Setup Wizard
pm uninstall --user 0 com.google.android.setupwizard >/dev/null 2>&1 && REM=$((REM+1))

# SIM Application System Dialog Container
pm uninstall --user 0 com.android.simappdialog >/dev/null 2>&1 && REM=$((REM+1))

# Lock Screen Dynamic Wallpaper Transition Module
pm uninstall --user 0 com.samsung.android.dynamiclock >/dev/null 2>&1 && REM=$((REM+1))

# Radio Interface Layer Error Notification Client
pm uninstall --user 0 com.sec.app.RilErrorNotifier >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Geo-Location Engine Base
pm uninstall --user 0 com.samsung.android.location >/dev/null 2>&1 && REM=$((REM+1))

# System Trace Tool Developer Diagnostic Logging
pm uninstall --user 0 com.android.traceur >/dev/null 2>&1 && REM=$((REM+1))

# Knox Isolated Security Sandbox Environment
pm uninstall --user 0 com.samsung.android.knox.sandbox >/dev/null 2>&1 && REM=$((REM+1))

# Knox Container Workspace Essential Framework
pm uninstall --user 0 com.samsung.android.knox.containercore >/dev/null 2>&1 && REM=$((REM+1))

# Google Play Services Security Background Config Updater
pm uninstall --user 0 com.google.android.configupdater >/dev/null 2>&1 && REM=$((REM+1))

# Digital Wellbeing
pm uninstall --user 0 com.samsung.android.forest >/dev/null 2>&1 && REM=$((REM+1))

# Google Family Link Supervision Service Backend
pm uninstall --user 0 com.google.android.gms.supervision >/dev/null 2>&1 && REM=$((REM+1))

# Facebook System Companion Service
pm uninstall --user 0 com.facebook.system >/dev/null 2>&1 && REM=$((REM+1))

# Google Android Mainline System Telemetry Client
pm uninstall --user 0 com.google.mainline.telemetry >/dev/null 2>&1 && REM=$((REM+1))

# Galaxy Store Billing Support Platform
pm uninstall --user 0 com.sec.android.app.billing >/dev/null 2>&1 && REM=$((REM+1))

# Multi-Device Experience Samsung Ecosystem Kit
pm uninstall --user 0 com.samsung.android.mdx.kit >/dev/null 2>&1 && REM=$((REM+1))

# IP Multimedia Subsystem Diagnostic Logger
pm uninstall --user 0 com.sec.imslogger >/dev/null 2>&1 && REM=$((REM+1))

# Advanced Field Test Service Mode Interface
pm uninstall --user 0 com.sec.android.app.servicemodeapp >/dev/null 2>&1 && REM=$((REM+1))

# OMA Device Management Client Software Update Agent
pm uninstall --user 0 com.wssyncmldm >/dev/null 2>&1 && REM=$((REM+1))

# Call History Backup Synchronization Database
pm uninstall --user 0 com.android.calllogbackup >/dev/null 2>&1 && REM=$((REM+1))

# Galaxy Store App Suite Interface
pm uninstall --user 0 com.sec.android.app.samsungapps >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Diagnostic Monitor Telemetry Agent
pm uninstall --user 0 com.sec.android.diagmonagent >/dev/null 2>&1 && REM=$((REM+1))

# Auto Doodle Creative Intelligence Drawing Engine
pm uninstall --user 0 com.sec.android.autodoodle.service >/dev/null 2>&1 && REM=$((REM+1))

# Quick Share Core File Sharing Component
pm uninstall --user 0 com.samsung.android.app.sharelive >/dev/null 2>&1 && REM=$((REM+1))

# Android Virtualization Environment System Resources
pm uninstall --user 0 com.android.virtualmachine.res >/dev/null 2>&1 && REM=$((REM+1))

# Google Ad Services System API
pm uninstall --user 0 com.google.android.adservices.api >/dev/null 2>&1 && REM=$((REM+1))

# Internal Vendor Hardware Configuration Module
pm uninstall --user 0 com.val.hardware >/dev/null 2>&1 && REM=$((REM+1))

# Google One-Time Initializer Post-Setup Helper
pm uninstall --user 0 com.google.android.onetimeinitializer >/dev/null 2>&1 && REM=$((REM+1))

# Samsung S-Pen/Stylus Handwriting Recognition Engine
pm uninstall --user 0 com.samsung.android.sdk.handwriting >/dev/null 2>&1 && REM=$((REM+1))

# Network Connectivity Diagnostics Utility
pm uninstall --user 0 com.samsung.android.networkdiagnostic >/dev/null 2>&1 && REM=$((REM+1))

# Enterprise Managed Profile Provisioning Controller
pm uninstall --user 0 com.android.managedprovisioning >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Advanced Institute of Technology Smart Device Sensor Backend
pm uninstall --user 0 com.samsung.sait.sohservice >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Secure Folder
pm uninstall --user 0 com.samsung.knox.securefolder >/dev/null 2>&1 && REM=$((REM+1))

# Bluetooth Smart Beacon Scanner & Manager
pm uninstall --user 0 com.samsung.android.beaconmanager >/dev/null 2>&1 && REM=$((REM+1))

# Default System Notes Assignment Role Wrapper
pm uninstall --user 0 com.android.role.notes.enabled >/dev/null 2>&1 && REM=$((REM+1))

# Silead Fingerprint Sensor Biometric Hardware Controller
pm uninstall --user 0 com.silead.fingerprint >/dev/null 2>&1 && REM=$((REM+1))

# Google Mainline Module Advertisement Services Backend
pm uninstall --user 0 com.google.mainline.adservices >/dev/null 2>&1 && REM=$((REM+1))

# In-Call Screen UI Database Content Provider
pm uninstall --user 0 com.samsung.android.incall.contentprovider >/dev/null 2>&1 && REM=$((REM+1))

# Open Market Customization Carrier Provisioning Agent
pm uninstall --user 0 com.samsung.android.app.omcagent >/dev/null 2>&1 && REM=$((REM+1))

# Context-Aware Intelligent Context Sync Service
pm uninstall --user 0 com.samsung.android.aware.service >/dev/null 2>&1 && REM=$((REM+1))

# Knox Error Reporting Module
pm uninstall --user 0 com.samsung.android.knox.er >/dev/null 2>&1 && REM=$((REM+1))

# Customer Component Information Verification Client
pm uninstall --user 0 com.sec.android.CcInfo >/dev/null 2>&1 && REM=$((REM+1))

# Enterprise Knox Cloud Mobile Device Management Client
pm uninstall --user 0 com.sec.enterprise.knox.cloudmdm.smdms >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Pre-Installed Device Configuration Auto-Installer Setup
pm uninstall --user 0 android.autoinstalls.config.samsung >/dev/null 2>&1 && REM=$((REM+1))

# Knox Zero-Trust Device Verification Security Framework
pm uninstall --user 0 com.samsung.android.knox.zt.framework >/dev/null 2>&1 && REM=$((REM+1))

# Vendor Camera Processing Extension Modules
pm uninstall --user 0 com.android.cameraextensions >/dev/null 2>&1 && REM=$((REM+1))
#KANGER PROTECTION - ALPANON

# Samsung Custom Setup Wizard App
pm uninstall --user 0 com.sec.android.app.SecSetupWizard >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Context Service Local Machine Learning Engine
pm uninstall --user 0 com.samsung.android.scs >/dev/null 2>&1 && REM=$((REM+1))

# Device Auto Blocker Malware & Sideloading bombing Engine
pm uninstall --user 0 com.samsung.android.rampart >/dev/null 2>&1 && REM=$((REM+1))

# Facebook Background System Services Module
pm uninstall --user 0 com.facebook.services >/dev/null 2>&1 && REM=$((REM+1))

# Knox Fingerprint Biometric Pattern Security Controller
pm uninstall --user 0 com.samsung.android.knox.kfbp >/dev/null 2>&1 && REM=$((REM+1))

# Google Android System Intelligence Package
#pm uninstall --user 0 com.google.android.as >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Positioning Infrastructure Support Engine
pm uninstall --user 0 com.samsung.android.samsungpositioning >/dev/null 2>&1 && REM=$((REM+1))

# Mobile Wireless Intrusion Prevention System (Wi-Fi Security)
pm uninstall --user 0 com.samsung.android.server.wifi.mobilewips >/dev/null 2>&1 && REM=$((REM+1))

# Device Quality Assurance Assessment Diagnostic Telemetry Agent
# massive resource hog
pm uninstall --user 0 com.samsung.android.dqagent >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Anti-Malware Authentication App Security Service
pm uninstall --user 0 com.samsung.aasaservice >/dev/null 2>&1 && REM=$((REM+1))

# MediaTek Low-Level Data Channel Link Controller
pm uninstall --user 0 com.mediatek.datachannel.service >/dev/null 2>&1 && REM=$((REM+1))

# Emergency Safety Assurance Location Messaging Backend
pm uninstall --user 0 com.sec.android.app.safetyassurance >/dev/null 2>&1 && REM=$((REM+1))

# Google Play System Backup Restore Infrastructure
pm uninstall --user 0 com.google.android.apps.restore >/dev/null 2>&1 && REM=$((REM+1))

# Custom Chrome Vendor Browser Modifications Provider
pm uninstall --user 0 com.sec.android.app.chromecustomizations >/dev/null 2>&1 && REM=$((REM+1))

# SmartThings Easy Connection Peripheral Ecosystem Setup Wizard
pm uninstall --user 0 com.samsung.android.easysetup >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Push Notification Core Platform
pm uninstall --user 0 com.sec.spp.push >/dev/null 2>&1 && REM=$((REM+1))

# Google Android System Intelligence Open Source Modules Backend
#pm uninstall --user 0 com.google.android.as.oss >/dev/null 2>&1 && REM=$((REM+1))

# Bixby Vision Intelligent AR Lens Feature Framework
pm uninstall --user 0 com.samsung.android.visualars >/dev/null 2>&1 && REM=$((REM+1))

# Ultra-Wideband Position Hardware Controller Resource Mapping
pm uninstall --user 0 com.android.uwb.resources >/dev/null 2>&1 && REM=$((REM+1))

# MediaTek IMS Wi-Fi Calling Offloading Architecture
pm uninstall --user 0 com.mediatek.op07.wfo >/dev/null 2>&1 && REM=$((REM+1))

# Stock Device Update Center Client App
pm uninstall --user 0 com.samsung.android.app.updatecenter >/dev/null 2>&1 && REM=$((REM+1))

# MediaTek Network Entitlement Management Profile Controller
pm uninstall --user 0 com.mediatek.entitlement.o2 >/dev/null 2>&1 && REM=$((REM+1))

# Subscriber Device Management Software Configuration Profile
pm uninstall --user 0 com.samsung.android.sdm.config >/dev/null 2>&1 && REM=$((REM+1))

# Google Device Health Services Adaptive Battery Engine
pm uninstall --user 0 com.google.android.apps.turbo >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Maps Tracking Agent Interface
pm uninstall --user 0 com.samsung.android.mapsagent >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Experience Mobile Platform Shared Framework Services
pm uninstall --user 0 com.samsung.android.mobileservice >/dev/null 2>&1 && REM=$((REM+1))

# Google Search App Configuration Overlay Module
pm uninstall --user 0 com.google.android.overlay.gmsconfig.gsa >/dev/null 2>&1 && REM=$((REM+1))

# Knox Neural Network Engine Runtime Accelerator
pm uninstall --user 0 com.samsung.android.knox.knnr >/dev/null 2>&1 && REM=$((REM+1))

# SmartThings Core Platform Infrastructure Connection Hub
pm uninstall --user 0 com.samsung.android.service.stplatform >/dev/null 2>&1 && REM=$((REM+1))

# Virtual SIM Profile Entitlement Synchronization Engine
pm uninstall --user 0 com.sec.vsim.ericssonnsds.webapp >/dev/null 2>&1 && REM=$((REM+1))

# Contacts Encrypted Security Encryption Key Provider Database
pm uninstall --user 0 com.android.providers.contactkeys >/dev/null 2>&1 && REM=$((REM+1))

# Android Compatibility Test Suite Verification Shim Module
pm uninstall --user 0 com.android.cts.ctsshim >/dev/null 2>&1 && REM=$((REM+1))

# Gallery Stories
pm uninstall --user 0 com.samsung.storyservice >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Secure Key Management System Cryptographic Client Agent
pm uninstall --user 0 com.skms.android.agent >/dev/null 2>&1 && REM=$((REM+1))

# OTA Software Update Delivery Agent Client
pm uninstall --user 0 com.sec.android.soagent >/dev/null 2>&1 && REM=$((REM+1))

# Web Browser Partner Bookmark Synchronization Database Provider
pm uninstall --user 0 com.android.providers.partnerbookmarks >/dev/null 2>&1 && REM=$((REM+1))

# Samsung Kids 
pm uninstall --user 0 com.samsung.android.kidsinstaller >/dev/null 2>&1 && REM=$((REM+1))

# Call and Text on Other Linked Galaxy Devices Synchronization Service
pm uninstall --user 0 com.samsung.android.mdecservice >/dev/null 2>&1 && REM=$((REM+1))

# Customization Service Machine Learning Analytics Engine (Rubin)
# massive telemetry and resource hog
pm uninstall --user 0 com.samsung.android.rubin.app >/dev/null 2>&1 && REM=$((REM+1))

# Global Remote Update Configuration Backend Service
pm uninstall --user 0 com.samsung.android.gru >/dev/null 2>&1 && REM=$((REM+1))

# Smart Cloud Policy Management System Validation Engine
pm uninstall --user 0 com.samsung.android.scpm >/dev/null 2>&1 && REM=$((REM+1))

#rro and runtime useless overlays
pm uninstall --user 0 android.auto_generated_rro_product__ >/dev/null 2>&1 && REM=$((REM+1))
pm uninstall --user 0 com.android.companiondevicemanager.auto_generated_characteristics_rro >/dev/null 2>&1 && REM=$((REM+1))
pm uninstall --user 0 com.android.phone.auto_generated_characteristics_rro >/dev/null 2>&1 && REM=$((REM+1))
pm uninstall --user 0 com.mediatek.MtkSettingsResOverlay 2>&1 && REM=$((REM+1))
pm uninstall --user 0 com.mediatek.SettingsProviderResOverlay 2>&1 && REM=$((REM+1))

#find my mobile
pm uninstall --user 0 com.samsung.android.fmm >/dev/null 2>&1 && REM=$((REM+1))

# Samsung multi device connectivity kit (disguised as quick share)
pm uninstall --user 0 com.samsung.android.mdx.kit >/dev/null 2>&1 && REM=$((REM+1))

#vowifi
pm uninstall --user 0 com.sec.epdg >/dev/null 2>&1 && REM=$((REM+1))
pm uninstall --user 0 com.sec.epdgtestapp >/dev/null 2>&1 && REM=$((REM+1))

#galaxy theme
pm uninstall --user 0 com.samsung.android.themestore >/dev/null 2>&1 && REM=$((REM+1))
pm uninstall --user 0 com.samsung.android.themecenter >/dev/null 2>&1 && REM=$((REM+1))

# game optimisation service
pm uninstall --user 0 com.samsung.android.game.gos >/dev/null 2>&1 && REM=$((REM+1))

#private access tokens
pm uninstall --user 0 com.samsung.android.privateaccesstokens >/dev/null 2>&1 && REM=$((REM+1))

#private compute services, # android intelligence depency prbably
pm uninstall --user 0 com.google.android.as.oss >/dev/null 2>&1 && REM=$((REM+1))

#separeted apps
pm uninstall --user 0 com.samsung.android.appseparation >/dev/null 2>&1 && REM=$((REM+1))



echo "Packages removed: $REM" >> "$LOG"

echo "" >> "$LOG"