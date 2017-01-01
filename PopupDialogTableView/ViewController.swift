//
//  ViewController.swift
//  PopupDialogTableView
//
//  Created by Martin Wildfeuer on 31.12.16.
//  Copyright © 2016 mwfire development. All rights reserved.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {

    // Called whenever the storyboard button is tapped
    @IBAction func onSelectCityTapped(_ sender: UIButton) {
        
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
    }
}

