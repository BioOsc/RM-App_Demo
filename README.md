# RM-App_Demo

## App Demo Nativa for iOS
Examen Técnico – SR Android/iOS Nativo

#### Installation
+ Clone project
+ Go to Project Folder
```bash
  cd my-project
```
+ Install pods (podfile already in project)
```bash
  pod install
```
+ Open .xcworkspace file from Xcode
Try to build and deploy target RMAppDemo

+ Some pod dependencies may be not updated with arget version:
Locate Pods Project under RMAppDemo, you can see the pods list in TARGETS left area
Locate Pod MDFInternationalization, Go to 'General' Tab and change Minimum Deployment to 15.6 or current RMAppDemo Minimum Deployment
Locate Pod Alamofire, Go to 'General' Tab and change Minimum Deployment to 15.6 or current RMAppDemo Minimum Deployment
Try to build and deploy target RMAppDemo
