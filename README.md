# Dater
An iOS (Swift 4) Tinder style dating App

(Recreating the design style only to enhance the learning experience)

## Detail
- The App contains three main MVCs - login page/guide, swipeable profiles VC and the profile settings VC

- Scrollable login-guide view 
  - Shown at the startup (gives users details on what the app is about)
  - Facebook login button for user sign-in

- Main view contains Card-style views of potential user profiles
  - Profiles swipeable via left or right swipes
  - As user swipes the profile left or right, a text indicating whether you are liking or passing the image shows up on the swiped profile
  - With the swipe gesture, the swiped profile also rotates
  - If the swipe goes too far to the left or right, the profile is automatically animated off the screen
  - A new profile appears once the current profile has been swiped off the screen
  
- Profile settings view contains
  - Profile images grid view
  - About-me description and distance preferences


- Extensive use of UICollectionView

## Technology
- Swift 4

## Cocoapods/Frameworks
- FBSDKLoginKit

## Screenshots
Login Guide Page 1: ![login1_iphonexspacegrey_portrait](https://user-images.githubusercontent.com/38988531/40705465-cf3dccca-639f-11e8-95bc-f659cc1f7bcd.png)
Login Guide Page 2: ![login2_iphonexspacegrey_portrait](https://user-images.githubusercontent.com/38988531/40705466-cf615c94-639f-11e8-85ef-2c57a584791f.png)
Login Guide Page 3: ![login3_iphonexspacegrey_portrait](https://user-images.githubusercontent.com/38988531/40705467-cf7cff08-639f-11e8-8aa3-29a11b5d1d80.png)
Facebook login: ![login4_iphonexspacegrey_portrait](https://user-images.githubusercontent.com/38988531/40705468-cf95880c-639f-11e8-9ca7-df18eb1e1fe7.png)
Potential Profiles: ![swipe1_iphonexspacegrey_portrait](https://user-images.githubusercontent.com/38988531/40705470-cfc8896e-639f-11e8-8d7f-2c37a7ba143b.png)
Like Swipe: ![swipe2_iphonexspacegrey_portrait](https://user-images.githubusercontent.com/38988531/40705471-cfe341c8-639f-11e8-8b5e-54055f81f071.png)
Pass Swipe: ![swipe3_iphonexspacegrey_portrait](https://user-images.githubusercontent.com/38988531/40705472-d0000c5e-639f-11e8-867c-052067dcb3f5.png)
Profile Settings: ![settings_iphonexspacegrey_portrait](https://user-images.githubusercontent.com/38988531/40705469-cfad17ce-639f-11e8-8708-51c876d218bc.png)
