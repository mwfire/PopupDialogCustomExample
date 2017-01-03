# Popup Dialog City Picker Example

This is a basic example of using a custom view controller with [Popup Dialog](https://github.com/Orderella/PopupDialog). This view controller is created programatically, so there is no xib involved. It contains a custom title label and a table view controller, used as a city picker.

<img src="https://github.com/mwfire/PopupDialogCustomExample/blob/master/Assets/screenshot.png?raw=true" width="250">

## How to

Just clone this repo and have a look at the classes, I have commented the steps needed to create the city picker. Find below the code to create the dialog, it can be found in `ViewController.swift`.

```swift
// Create our custom view controller programatically
let vc = PopupTableViewController(nibName: nil, bundle: nil)

// Create the PopupDialog with a completion handler,
// called whenever the dialog is dismissed
let popup = PopupDialog(viewController: vc, gestureDismissal: false) {
    guard let city = vc.selectedCity else { return }
    print("User selected city: \(city)")
}

// Create a cancel button for the dialog,
// including a button action
let cancel = DefaultButton(title: "Cancel") {
    print("User did not select a city")
}

// Add the cancel button we just created to the dialog
popup.addButton(cancel)

// Moreover, we set a list of cities on our custom view controller
vc.cities = ["Munich", "Budapest", "Krakow", "Rome", "Paris", "Nice", "Madrid", "New York", "Moscow", "Peking", "Tokyo"]

// We also pass a reference to our PopupDialog to our custom view controller
// This way, we can dismiss and manipulate it from there
vc.popup = popup

// Last but not least: present the PopupDialog
present(popup, animated: true, completion: nil)
```

## Author

Martin Wildfeuer, mwfire@mwfire.de
You might also want to follow me on Twitter, [@theMWFire](https://twitter.com/theMWFire)

## License

PopupDialogTableView is available under the MIT license. See the LICENSE file for more info.