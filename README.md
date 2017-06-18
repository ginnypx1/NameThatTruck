# Name That Truck

"Name That Truck" is my Udacity iOS Nanodegree Final Project. It allows truck-loving todders to identify working trucks, see a gif of the truck in action, and look at more pictures of that working truck retrieved from Flickr.

I started my coding journey in the fall of 2012 in order to build this game for my son. I am incredibly excited that I'm finally building it for him and toddlers around the world to enjoy.

## App Store

[Download NAME THAT TRUCK from the AppStore!](https://itunes.apple.com/us/app/namethattruck/id1244210414?ls=1&mt=8)

![NAME THAT TRUCK](https://upload.wikimedia.org/wikipedia/commons/3/3c/Download_on_the_App_Store_Badge.svg)

## Instructions

To play the game, select a set of trucks from the menu screen: Emergency Vehicles, Construction Trucks, City Trucks, or all Trucks.

When you reach the game screen, you will see images of six trucks and hear an audio prompt asking you to identify a certain truck (The prompt will also be present on the screen). If you select the wrong truck, the audio prompt will tell the name of the truck you selected. If you select the correct truck, a new screen appears with a gif of the truck performing its primary job. 

From the gif video popdown screen, users can either hit the **<-** button to continue the game, or select the **Truck Picture** button  to load a collection view of 21 images of that type of truck pulled from Flickr.

To zoom in on a photo, simply tap the photo, and the photo will appear close up over the collection view. Hit the **<-** button to make the close-up photo disappear. A new collection of trucks can be loaded at any time by pressing the **See more trucks!** button at the bottom of the screen. This new set of images will replace the stored set of images in Core Data. Users can return directly to the game screen at any time by pressing the **<** button.

The Creative Commons Attribution License credits can be seen by clicking on the **CC BY** button on the settings screen. Game audio can be toggled on and off from the settings screen. More Trucks feature can also be deactivated from the settings page if a parent prefers. Hit the **<-** button to return to the main menu.

## Technical Information

- The Flickr API can be found at: https://www.flickr.com/services/api/
- The SwiftyGif Cocoa Pod can be found at: https://cocoapods.org/?q=swiftygif
- Firebase Analytics tracks data pertaining to "Name That Truck"'s usage
