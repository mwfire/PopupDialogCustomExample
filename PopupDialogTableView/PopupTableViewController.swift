//
//  PopupTableViewController.swift
//  PopupDialogTableView
//
//  Created by Martin Wildfeuer on 31.12.16.
//  Copyright © 2016 mwfire development. All rights reserved.
//

import UIKit
import PopupDialog

final class PopupTableViewController: UIViewController {
    
    // MARK: Public
    
    /// The PopupDialog this view is contained in
    /// Note: this has to be weak, otherwise we end up
    /// creating a retain cycle!
    public weak var popup: PopupDialog?
    
    /// The city the user did choose
    public fileprivate(set) var selectedCity: String?
    
    /// A list of cities to display
    public var cities = [String]() {
        didSet { baseView.tableView.reloadData() }
    }
    
    // MARK: Private

    // We will use this instead to reference our
    // controllers view instead of `view`
    fileprivate var baseView: PopupTableView {
        return view as! PopupTableView
    }
    
    // MARK: View related
    
    // Replace the original controller view
    // with our dedicated view
    override func loadView() {
        view = PopupTableView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the dialog (custom) title
        baseView.titleLabel.text = "Choose City"
        
        // Setup tableView
        baseView.tableView.register(PopupTableViewCell.self, forCellReuseIdentifier: PopupTableViewCell.cellIdentifier)
        baseView.tableView.dataSource = self
        baseView.tableView.delegate = self
    }
}

// MARK: - TableView Data Source

extension PopupTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopupTableViewCell.cellIdentifier, for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
}

// MARK: - TableView Delegate

extension PopupTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCity = cities[indexPath.row]
        popup?.dismiss(animated: true)
    }
}
