# Dater
An iOS 11 dating App mockup

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

## Technology
- Swift 4

## Cocoapods/Frameworks
- FBSDKLoginKit

## Screenshots
