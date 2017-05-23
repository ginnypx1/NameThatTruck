# Name That Truck

"Name That Truck" is my Udacity iOS Nanodegree Final Project. It allows truck-loving todders to identify working trucks, see a gif of the truck in action, and look at more pictures of that working truck retrieved from Flickr.

I started my coding journey in the fall of 2012 in order to build this game for my son. I am incredibly excited that I'm finally building it for him and toddlers around the world to enjoy.

## Install

To check out my version of "Name That Truck":

1. Clone or download my repository:
` $ https://github.com/ginnypx1/NameThatTruck.git `

2. Enter the "Name That Truck" directory:
` $ cd /NameThatTruck-master/ `

3. Open "Name That Truck" in XCode:
` $ open NameThatTruck.xcodeproj `

To run the project, you will need to add a Private.swift file with your Flickr API key information:

```
let YOUR_API_KEY = <YOUR_API_KEY>
```

## Instructions

To play the game, select a set of trucks from the menu screen: Emergency Vehicles, Construction Trucks, City Trucks, or all Trucks.

When you reach the game screen, you will see images of six trucks and hear an audio prompt asking you to identify a certain truck (The prompt will also be present on the screen). If you select the wrong truck, the audio prompt will tell you which truck you selected, and again ask you to find a certain truck. If you select the correct truck, a new screen appears with a gif of the truck performing its primary job. 

From the video screen, users can either hit the **<** button to continue the game, or select the **See More Trucks!** button on the bottom of the screen to load a collection view on 21 images of that type of truck pulled from Flickr.

To zoom in on a photo, simply tap the photo, and all the photos change to a larger size. To see all the truck photos again, tap the photo one more time, and the trucks will fill the screen in their original, smaller size. A new collection of trucks can be loaded by pressing the **More trucks!** button at the bottom of the screen. Users can return to the game at any time by pressing the **<** button.

## Technical Information

- The Flickr API can be found at: https://www.flickr.com/services/api/
- The SwiftyGif Cocoa Pod can be found at: https://cocoapods.org/?q=swiftygif

## Improvements

**THIS BUILD IS CURRENTLY IN PROGRESS**

Already built:
- Full version of "Name That Truck" that offers construction, emergency, city and all trucks games.
- Selecting the correct truck shows you a new screen with a repeating gif of that truck working.
- From the close-up picture of the truck, you can select the photo of the truck and segue to a view of many photos of the same kind of truck fetched with the Flicker API and stored in Core Data.
- Push button sound effects
- Audio Prompts

To do:

- Add a credit page for Creative Commons licensed videos
- Can I change the background menu pic just for iPads in 1/3 screen splits?
- Testing
