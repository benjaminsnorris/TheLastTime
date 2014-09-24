TheLastTime
===========

A simple iOS application that allows you to mark the last time you did something.

##Objectives
Review principles of adding an XIB file and storing values to NSUserDefaults

###Step 1: Add a new ViewController as your root view controller
- Create a new List view controller
- Add the view controller in nav controller to the rootViewController of the window

###Step 2: Add UI to the view controller XIB file
- Add a button with a title "Log Now"
- Add a textfield with the placeholder "Enter Activity"
- Add a label with the text "time: "

###Step 3: Add the interface objects in code
- Add an IBAction for when the button is touched up inside
- Add an IBOutlet for the textfield and label
- Wire up the outlets to the objects and the action to the controlEvent on the button

##Step 4: Store and retrieve from User Defaults
- When the user taps the button update the time label
- Once you've updated the time label, store the values of the the textfield and label to user defaults
- When the view loads retrieve the values from user defaults

Note: You may need to add the view controller as a text field delegate if you want to dismiss the keyboard
